var venue = {
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
    addPlaceFormValidation: function () {
        $('#frmAddPlace').validate({
            rules: {
                venuename: {
                    required: true
                },
                venuetype: {
                    required: true
                },
                foundationyear: {
                    required: true,
                    digits: true,
                    minlength: 4,
                    maxlength: 4
                },
                regno: {
                    required: true
                },
                renovationyear: {
                    required: true,
                    digits: true,
                    minlength: 4,
                    maxlength: 4
                },
                area: {
                    required: true,
                    number: true
                },
                openspaces: {
                    required: true,
                    number: true
                },
                service: {
                    required: true
                },
                seasonactivity: {
                    required: true
                },
                country: {
                    required: true
                },
                city: {
                    required: true
                },
                street: {
                    required: true
                },
                zipcode: {
                    required: true,
                    number: true
                }
            },
            messages: {
                venuename: "Please enter Venue Name",
                venuetype: {
                    required: "This field is required."
                },
                foundationyear: {
                    minlength: "Please enter 4 digits for year",
                    maxlength: "Please enter 4 digits for year"
                },
                regno: {
                    required: "This field is required."
                },
                renovationyear: {
                    minlength: "Please enter 4 digits for year",
                    maxlength: "Please enter 4 digits for year"
                },
                area: {
                    number: "Please enter whole or decimal values"
                },
                openspaces: {
                    number: "Please enter whole or decimal values"
                },
                service: {
                    required: "This field is required."
                },
                seasonactivity: {
                    required: "This field is required."
                },
                country: {
                    required: "This field is required."
                },
                city: {
                    required: "This field is required."
                },
                street: {
                    required: "This field is required."
                },
                zipcode: {
                    number: "Please enter valid Zip Code"
                }
            },
            submitHandler: function (form) {
                venue.addPlace();
            }
        });
    },
    addContactFormValidation: function () {
        $('#frmAddContact').validate({
            rules: {
                phone: {
                    required: true,
                    digits: true
                },
                phone2: {
                    digits: true
                },
                fax: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                position: {
                    required: true
                },
                extmancomp: {
                    required: true
                }
            },
            messages: {
                phone: {
                    required: "This field is required."
                },
                fax: {
                    required: "This field is required."
                },
                email: {
                    required: "This field is required."
                },
                position: {
                    required: "This field is required."
                },
                extmancomp: {
                    required: "This field is required."
                }
            },
            submitHandler: function (form) {
                venue.addContact();
            }
        });
    },
    addPlaceDescriptionFormValidation: function () {
        $('#frmPlaceDesc').validate({
            rules: {
                placedescription: {
                    required: true
                },
                advantage1: {
                    required: true
                },
                advantage2: {
                    required: true
                }
            },
            messages: {
                placedescription: {
                    required: "This field is required."
                },
                advantage1: {
                    required: "This field is required."
                },
                advantage2: {
                    required: "This field is required."
                }
            },
            submitHandler: function (form) {
                venue.addVenueDescription();
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
                if (result.status == 1) {
                    $('#alert-success').show(function () {
                        $(this).slideDown();
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    addContact: function () {
        $.ajax({
            type: "POST",
            url: "/Venue/UpdatePlaceContact",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: $('#venueid').val(),
                Phone: $('#phone').val(),
                Phone2: $('#phone2').val(),
                Fax: $('#fax').val(),
                Email: $('#email').val(),
                Position: $('#position').val(),
                ExtManCompanyName: $('#extmancomp').val()
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-contact-success').show(function () {
                        $(this).slideDown();
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    addVenueDescription: function () {
        $.ajax({
            type: "POST",
            url: "/Venue/UpdateVenueDescription",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: $('#venueid').val(),
                Description: $('#placedescription').val(),
                DistAdvantage: $('#advantage1').val(),
                DistAdvantageIn: $('#advantage2').val()
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-placedesc-success').show(function () {
                        $(this).slideDown();
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
};

var alerts = {
    hideAlerts: function () {
        $('#seasonal').hide();
        $('#alert-success').hide();
        $('#alert-contact-success').hide();
        $('#alert-placedesc-success').hide();
    }
};

var events = {
    getPrivateEvents: function () {
        $.ajax({
            type: "GET",
            url: "/Venue/GetPrivateEvents",
            dataType: "json",
            success: function (result) {
                var eventlist = $('ul#private-events');

                $.each(result, function (index, value) {
                    $('<li>' +
                           '<input type="checkbox" value="' + value.Event + '">' + value.Event +
                      '</li>').appendTo(eventlist);
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    getBusinessEvents: function () {
        $.ajax({
            type: "GET",
            url: "/Venue/GetBusinessEvents",
            dataType: "json",
            success: function (result) {
                var eventlist = $('ul#corporate-events');

                $.each(result, function (index, value) {
                    $('<li>' +
                           '<input type="checkbox" value="' + value.Event + '">' + value.Event +
                      '</li>').appendTo(eventlist);
                });
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
};

$(document).ready(function () {
    alerts.hideAlerts();

    venue.getVenues();
    venue.loadVenueTypes();
    venue.loadCountries();
    events.getPrivateEvents();
    events.getBusinessEvents();

    venue.addPlaceFormValidation();
    venue.addContactFormValidation();
    venue.addPlaceDescriptionFormValidation();

    $('#seasonactivity').change(function () {
        var val = $(this).val();
        
        if (val == "Seasonal")
            $('#seasonal').show();
        else
            $('#seasonal').hide();
    });
});