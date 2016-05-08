$(document).ready(function () {
    var roles = {
        getRoles: function () {
            $.ajax({
                type: "GET",
                url: "/Roles/GetRoles",
                dataType: "json",
                success: function (result) {
                    var tbody = $('tbody#tbodyRoles');
                    tbody.empty();

                    $.each(result, function (index, value) {
                        $('<tr><td>' + value.Id + '</td><td>' + value.Name + '</td>' + '</tr>').appendTo(tbody);
                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    };

    roles.getRoles();
});