﻿var venue = {
    getVenues: function () {
        $.ajax({
            type: "GET",
            url: "/Venue/GetUnapprovedVenues",
            dataType: "json",
            success: function (result) {
                var body = $('#venue-list');

                $.each(result, function (index, value) {
                    $('<tr>' +
                        '<td>' + value.Name + '</td>' +
                        '<td>' + '<a href="/Venue/Approve/' + value.Pk_VenueId + '">Approve</a>' + '</td>' +
                      '</tr>').appendTo(body);
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    validateForm: function () {
        $('#frmAddPlace').validate({
            rules: {
                venuename: "required",
                venuetype: "required",
                foundationyear: "required",
                regno: "required",
                renovationyear: "required",
                area: "required",
                openspaces: "required",
                service: "required",
                seasonactivity: "required",
                country: "required",
                city: "required",
                street: "required",
                zipcode: "required"
            },
            messages: {
                venuename: "Please enter Venue Name",
                venuetype: "Please select Venue Type",
                foundationyear: "Please enter Foundation Year",
                regno: "Please enter Registration #",
                renovationyear: "Please enter Renovation Year",
                area: "Please enter Area (sq)",
                openspaces: "Please enter Open Spaces",
                service: "Please select Service",
                seasonactivity: "Please select Season Activity",
                country: "Please select Country",
                city: "Please select City",
                street: "Please enter Street",
                zipcode: "Please enter Zip Code"
            },
            submitHandler: function (form) {
                venue.addPlace();
            }
        });
    },
    loadVenueTypes: function () {
        $.ajax({
            type: "GET",
            url: "/Venue/GetVenueTypes",
            dataType: "json",
            success: function (result) {
                var venueType = $('#venuetype');

                $.each(result, function (index, value) {
                    $('<option value="' + value.VenueType1 + '">' + value.VenueType1 + '</option>').appendTo(venueType);
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    loadCountries: function () {
        $.ajax({
            type: "GET",
            url: "/Venue/GetCountryList",
            dataType: "json",
            success: function (result) {
                var country = $('#country');

                $.each(result, function (index, value) {
                    $('<option value="' + value.country_name + '">' + value.country_name + '</option>').appendTo(country);
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    addPlace: function () {
        var seasonactivity = $('#seasonactivity').val();
        var activity = "";

        if (seasonactivity == "Seasonal")
            activity = $('#seasonal').val();
        else
            activity = seasonactivity;

        $.ajax({
            type: "POST",
            url: "/Venue/UpdatePlaceInitialInfo",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Pk_VenueId: $('#venueid').val(),
                Approved: true,
                Id: $('#hostid').val(),
                Name: $('#venuename').val(),
                Type: $('#venuetype').val(),
                FoundationYr: $('#foundationyear').val(),
                RegNo: $('#regno').val(),
                RenovationYr: $('#renovationyear').val(),
                Area: $('#area').val(),
                OpenSpace: $('#openspaces').val(),
                Service: $('#service option:selected').text(),
                SeasonActs: activity,
                Country: $('#country option:selected').text(),
                City: $('#city').val(),
                Street: $('#street').val(),
                ZipCode: $('#zipcode').val()
            },
            success: function (result) {
                console.log(result);
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
};

$(document).ready(function () {
    $('#seasonal').hide();

    venue.getVenues();
    venue.loadVenueTypes();
    venue.loadCountries();

    venue.validateForm();

    $('#seasonactivity').change(function () {
        var val = $(this).val();
        
        if (val == "Seasonal")
            $('#seasonal').show();
        else
            $('#seasonal').hide();
    });
});