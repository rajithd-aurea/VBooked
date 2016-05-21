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
    }
};

$(document).ready(function () {
    venue.getVenues();

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
            location: "required",
            settlement: "required",
            street: "required",
            targeting: "required"
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
            location: "Please enter Location",
            settlement: "Please enter Settlement",
            street: "Please enter Street",
            targeting: "Please enter Targeting"
        },
        submitHandler: function (form) {
            alert("Success!");
        }
    });
});