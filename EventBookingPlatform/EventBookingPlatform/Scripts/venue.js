var venue = {
    getVenues: function () {
        $.ajax({
            type: "GET",
            url: "/Venue/GetVenueList",
            dataType: "json",
            success: function (result) {
                var body = $('#venue-list');

                $.each(result, function (index, value) {
                    console.log(value.Name + ' - ' + value.Pk_VenueId);
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
});