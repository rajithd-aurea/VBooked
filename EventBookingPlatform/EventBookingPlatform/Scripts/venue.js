var venue = {
    addVenueName: function (forgerytoken, hostid, venuename, status) {
        $.ajax({
            type: "POST",
            url: "/Venue/AddVenueName",
            data: {
                __RequestVerificationToken: forgerytoken,
                hostid: hostid,
                venuename: venuename,
                status: status
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-addvenue-success').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);
                    });

                    $('#venuename').val("");
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    //getUnapprovedVenues: function () {
    //    $.ajax({
    //        type: "GET",
    //        url: "/Venue/GetPendingForApprovalVenues",
    //        dataType: "json",
    //        success: function (result) {
    //            var body = $('#unapprovedVenueList');
    //            $.each(result, function (index, value) {
    //                $.each(value, function (index, value) {
    //                    $('<tr>' +
    //                        '<td>' + value.VenueName + '</td>' +
    //                        '<td>' + '<a href="' + '/Venue/Approve/' + value.VenueId + '/' + value.Email + '/' + value.VenueName + '">Approve</a>' + '</td>' +
    //                      '</tr>').appendTo(body);
    //                });
    //            });
    //        },
    //        error: function (error) {
    //            console.log(error);
    //        }
    //    });
    //},
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
    uploadVenueStructureImage: function () {
        var data = new FormData();
        var files = $("#VenueStructure").get(0).files;
        if (files.length > 0) {
            data.append("MyImages", files[0]);
        }

        $.ajax({
            url: "/Venue/UploadVenueStructureImage",
            type: "POST",
            processData: false,
            contentType: false,
            data: data,
            success: function (response) {
                if (response.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(response.message);
                    });
                }
            },
            error: function (er) {
                console.log(er);
            }
        });
    },
    saveVenueStructureInfo: function () {
        var filename = $('#VenueStructure').val().split('\\').pop();

        $.ajax({
            type: "POST",
            url: "/Venue/SaveCharacterizationPlaceInfo",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: parseInt($('#venueid').val()),
                IsApproved: false,
                OptionName: "StructureOfTheVenue",
                OptionValue: $('#drpVenueStructure option:selected').text(),
                OptionImageLocation: "/Content/Files/Venues/Images/VenueStructure/" + filename,
                OptionSize: 0,
                OpenAreasImage: "N/A"
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    uploadAViewImage: function () {
        var data = new FormData();
        var files = $("#AView").get(0).files;
        if (files.length > 0) {
            data.append("MyImages", files[0]);
        }

        $.ajax({
            url: "/Venue/UploadAViewImage",
            type: "POST",
            processData: false,
            contentType: false,
            data: data,
            success: function (response) {
                if (response.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(response.message);
                    });
                }
            },
            error: function (er) {
                console.log(er);
            }
        });
    },
    saveAViewInfo: function () {
        var filename = $('#AView').val().split('\\').pop();

        $.ajax({
            type: "POST",
            url: "/Venue/SaveCharacterizationPlaceInfo",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: parseInt($('#venueid').val()),
                IsApproved: false,
                OptionName: "AView",
                OptionValue: $('#drpAViewOption option:selected').text(),
                OptionImageLocation: "/Content/Files/Venues/Images/AView/" + filename,
                OptionSize: 0,
                OpenAreasImage: "N/A"
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    saveMaxRoomsAreasEnclosures: function () {
        $.ajax({
            type: "POST",
            url: "/Venue/SaveCharacterizationPlaceInfo",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: parseInt($('#venueid').val()),
                OptionName: "MaxRoomsAreasEnclosures",
                OptionValue: $('#drpMaxRoomsAreasOption').val(),
                OptionImageLocation: "N/A",
                OptionSize: 0,
                OpenAreasImage: "N/A"
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    uploadPrivacyImage: function () {
        var data = new FormData();
        var files = $("#Privacy").get(0).files;
        if (files.length > 0) {
            data.append("MyImages", files[0]);
        }

        $.ajax({
            url: "/Venue/UploadPrivacyImage",
            type: "POST",
            processData: false,
            contentType: false,
            data: data,
            success: function (response) {
                if (response.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(response.message);
                    });
                }
            },
            error: function (er) {
                console.log(er);
            }
        });
    },
    savePrivacyInfo: function () {
        var filename = $('#Privacy').val().split('\\').pop();

        $.ajax({
            type: "POST",
            url: "/Venue/SaveCharacterizationPlaceInfo",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: parseInt($('#venueid').val()),
                IsApproved: false,
                OptionName: "Privacy",
                OptionValue: $('#drpPrivacyOption').val(),
                OptionImageLocation: "/Content/Files/Venues/Images/Privacy/" + filename,
                OptionSize: 0,
                OpenAreasImage: "N/A"
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    uploadPillarsImage: function () {
        var data = new FormData();
        var files = $("#Pillars").get(0).files;
        if (files.length > 0) {
            data.append("MyImages", files[0]);
        }

        $.ajax({
            url: "/Venue/UploadPillarsImage",
            type: "POST",
            processData: false,
            contentType: false,
            data: data,
            success: function (response) {
                if (response.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(response.message);
                    });
                }
            },
            error: function (er) {
                console.log(er);
            }
        });
    },
    savePillarsInfo: function () {
        var filename = $('#Pillars').val().split('\\').pop();

        $.ajax({
            type: "POST",
            url: "/Venue/SaveCharacterizationPlaceInfo",
            data: {
                __RequestVerificationToken: $('input[name=__RequestVerificationToken]').val(),
                Fk_VenueId: parseInt($('#venueid').val()),
                IsApproved: false,
                OptionName: "Pillars",
                OptionValue: $('#drpPillarsOption').val(),
                OptionImageLocation: "/Content/Files/Venues/Images/Pillars/" + filename,
                OptionSize: 0,
                OpenAreasImage: "N/A"
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-place-characterization').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);
                    });
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    },
    //uploadOpenAreasImage: function () {
    //    var data = new FormData();
    //    var files = $("#OpenAreas").get(0).files;
    //    if (files.length > 0) {
    //        data.append("MyImages", files[0]);
    //    }
    //    $.ajax({
    //        url: "/Venue/UploadOpenAreasImage",
    //        type: "POST",
    //        processData: false,
    //        contentType: false,
    //        data: data,
    //        success: function (response) {
    //            if (response.status == 1) {
    //                $('#alert-place-characterization').show(function () {
    //                    $(this).slideDown();
    //                    $(this).find('p.img-for').text(response.message);
    //                });
    //            }
    //        },
    //        error: function (er) {
    //            console.log(er);
    //        }
    //    });
    //},
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

                events.addEventsToVenue($('#venueid').val());
            }
        });
    },
    //addOpenAreasImage: function () {
    //    $('#frmAddOpenAreas').validate({
    //        rules: {
    //            OpenAreas: {
    //                required: true
    //            }
    //        },
    //        messages: {
    //            OpenAreas: {
    //                required: "This field is required."
    //            }
    //        },
    //        submitHandler: function (form) {
    //            venue.uploadOpenAreasImage();
    //        }
    //    });
    //},
    addPlace: function () {
        var seasonactivity = $('#seasonactivity').val();
        var activity = "";
        var street2 = $('#street2').val();

        if (seasonactivity == "Seasonal")
            activity = $('#seasonal').val();
        else
            activity = seasonactivity;

        if (street2 != "")
            street2 = $('#street2').val();
        else
            street2 = "n/a";

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
                Street1: $('#street1').val(),
                Street2: street2,
                ZipCode: $('#zipcode').val(),
                PBox: $('#pbox').val()
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
        $('#alert-place-characterization').hide();
        $('#alert-certificates').hide();
        $('#alert-addvenue-success').hide();
        $('#alert-pending-venue-approval').hide();
        $('#alert-addbusinesscertificate').hide();
        $('#alert-updateemail').hide();
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
    },
    addEventsToVenue: function (venueid) {
        var privateEventsList = $('ul#private-events li');

        $(privateEventsList).find('input[type=checkbox]:checked').each(function () {
            $.ajax({
                type: "POST",
                url: "/Venue/AddEventsToVenue",
                data: {
                    Fk_VenueId: venueid,
                    Events: this.value
                },
                success: function (result) {
                    console.log(result);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });

        var corporateEventsList = $('ul#corporate-events li');

        $(corporateEventsList).find('input[type=checkbox]:checked').each(function () {
            $.ajax({
                type: "POST",
                url: "/Venue/AddEventsToVenue",
                data: {
                    Fk_VenueId: venueid,
                    Events: this.value
                },
                success: function (result) {
                    console.log(result);
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    }
};

var certificates = {
    uploadBusinessCertificate: function (venueid) {
        var data = new FormData();
        var files = $("#BusinessCert").get(0).files;
        if(files.length > 0) {
            data.append("MyCertificates", files[0]);
        }

        $.ajax({
            url: "/Venue/UploadBusinessCertificate",
            type: "POST",
            processData: false,
            contentType: false,
            data: data,
            success: function (response) {
                if (response.status == 1) {
                    $('#alert-addbusinesscertificate').removeClass('alert-danger');
                    $('#alert-addbusinesscertificate').addClass('alert-success').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(response.message);
                    });

                    certificates.saveBusinessCertificateInfo(venueid, response.imagelocation, false);
                }
            },
            error: function (er) {
                $('#alert-addbusinesscertificate').removeClass('alert-success');
                $('#alert-addbusinesscertificate').addClass('alert-danger').show(function () {
                    $(this).slideDown();
                    $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                });
            }
        });
    },
    saveBusinessCertificateInfo: function (venueid, imagelocation, status) {
        $.ajax({
            type: "POST",
            url: "/Venue/SaveBusinessCertificateInfo",
            data: {
                venueid: venueid,
                imageserverlocation: imagelocation,
                status: status
            },
            success: function (result) { },
            error: function (error) { }
        });
    },
    addTermsAndConditionsCertificate: function () {
        var fileExtension = $('#Terms').val().split('.').pop().toLowerCase();

        if (fileExtension == 'doc' || fileExtension == 'docx' || fileExtension == 'pdf') {
            var data = new FormData();
            var files = $("#Terms").get(0).files;
            if (files.length > 0) {
                data.append("MyCertificates", files[0]);
            }

            $.ajax({
                url: "/Venue/UploadTermsAndConditionsCertificate",
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    if (response.status == 1) {
                        $('#alert-certificates').removeClass('alert-danger');
                        $('#alert-certificates').addClass('alert-success').show(function () {
                            $(this).slideDown();
                            $(this).find('p.img-for').text(response.message);
                        });
                    }
                },
                error: function (er) {
                    $('#alert-certificates').removeClass('alert-success');
                    $('#alert-certificates').addClass('alert-danger').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                    });
                }
            });
        }
        else {
            alert("Must upload Word or PDF file.");
        }
    },
    addBusinessLicense: function () {
        var fileExtension = $('#BusinessLicense').val().split('.').pop().toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'pdf') {
            var data = new FormData();
            var files = $("#BusinessLicense").get(0).files;
            if (files.length > 0) {
                data.append("MyCertificates", files[0]);
            }

            $.ajax({
                url: "/Venue/UploadBusinessLicenseCertificate",
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    if (response.status == 1) {
                        $('#alert-certificates').removeClass('alert-danger');
                        $('#alert-certificates').addClass('alert-success').show(function () {
                            $(this).slideDown();
                            $(this).find('p.img-for').text(response.message);
                        });
                    }
                },
                error: function (er) {
                    $('#alert-certificates').removeClass('alert-success');
                    $('#alert-certificates').addClass('alert-danger').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                    });
                }
            });
        }
        else {
            alert("Must upload JPG or PDF file.");
        }
    },
    addPoliceAuthorization: function () {
        var fileExtension = $('#PoliceAuth').val().split('.').pop().toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'pdf') {
            var data = new FormData();
            var files = $("#PoliceAuth").get(0).files;
            if (files.length > 0) {
                data.append("MyCertificates", files[0]);
            }

            $.ajax({
                url: "/Venue/UploadPoliceAuthorizationCertificate",
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    if (response.status == 1) {
                        $('#alert-certificates').removeClass('alert-danger');
                        $('#alert-certificates').addClass('alert-success').show(function () {
                            $(this).slideDown();
                            $(this).find('p.img-for').text(response.message);
                        });
                    }
                },
                error: function (er) {
                    $('#alert-certificates').removeClass('alert-success');
                    $('#alert-certificates').addClass('alert-danger').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                    });
                }
            });
        }
        else {
            alert("Must upload JPG or PDF file.");
        }
    },
    addFireDeptCertificate: function () {
        var fileExtension = $('#FireDeptCert').val().split('.').pop().toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'pdf') {
            var data = new FormData();
            var files = $("#FireDeptCert").get(0).files;
            if (files.length > 0) {
                data.append("MyCertificates", files[0]);
            }

            $.ajax({
                url: "/Venue/UploadFireDepartmentCertificate",
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    if (response.status == 1) {
                        $('#alert-certificates').removeClass('alert-danger');
                        $('#alert-certificates').addClass('alert-success').show(function () {
                            $(this).slideDown();
                            $(this).find('p.img-for').text(response.message);
                        });
                    }
                },
                error: function (er) {
                    $('#alert-certificates').removeClass('alert-success');
                    $('#alert-certificates').addClass('alert-danger').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                    });
                }
            });
        }
        else {
            alert("Must upload JPG or PDF file.");
        }
    },
    addSanitationCertificate: function () {
        var fileExtension = $('#SanitationCert').val().split('.').pop().toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'pdf') {
            var data = new FormData();
            var files = $("#SanitationCert").get(0).files;
            if (files.length > 0) {
                data.append("MyCertificates", files[0]);
            }

            $.ajax({
                url: "/Venue/UploadSanitationCertificate",
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    if (response.status == 1) {
                        $('#alert-certificates').removeClass('alert-danger');
                        $('#alert-certificates').addClass('alert-success').show(function () {
                            $(this).slideDown();
                            $(this).find('p.img-for').text(response.message);
                        });
                    }
                },
                error: function (er) {
                    $('#alert-certificates').removeClass('alert-success');
                    $('#alert-certificates').addClass('alert-danger').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                    });
                }
            });
        }
        else {
            alert("Must upload JPG or PDF file.");
        }
    },
    addThirdPartyInsuranceCertificate: function () {
        var fileExtension = $('#ThirdPartyInsurance').val().split('.').pop().toLowerCase();

        if (fileExtension == 'jpg' || fileExtension == 'pdf') {
            var data = new FormData();
            var files = $("#ThirdPartyInsurance").get(0).files;
            if (files.length > 0) {
                data.append("MyCertificates", files[0]);
            }

            $.ajax({
                url: "/Venue/UploadThirdPartyInsurance",
                type: "POST",
                processData: false,
                contentType: false,
                data: data,
                success: function (response) {
                    if (response.status == 1) {
                        $('#alert-certificates').removeClass('alert-danger');
                        $('#alert-certificates').addClass('alert-success').show(function () {
                            $(this).slideDown();
                            $(this).find('p.img-for').text(response.message);
                        });
                    }
                },
                error: function (er) {
                    $('#alert-certificates').removeClass('alert-success');
                    $('#alert-certificates').addClass('alert-danger').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text("Uploaded file size exceeds 3MB.");
                    });
                }
            });
        }
        else {
            alert("Must upload JPG or PDF file.");
        }
    }
};

var host = {
    updateHostEmail: function (forgerytoken, hostid, venueid, email) {
        $.ajax({
            type: "POST",
            url: "/Venue/UpdateHostEmail",
            data: {
                __RequestVerificationToken: forgerytoken,
                hostid: hostid,
                email: email
            },
            success: function (result) {
                if (result.status == 1) {
                    $('#alert-updateemail').show(function () {
                        $(this).slideDown();
                        $(this).find('p.img-for').text(result.message);

                        $('#currentuseremail').val("");
                    });

                    setTimeout(function () {
                        $('#editEmailModal').modal('hide');

                        window.location = "/Venue/Module?" + "mainmodule=Settings" + "&parentmodule=Main" + "&venueid=" + venueid;
                    }, 2000);
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
};

$(document).ready(function () {
    alerts.hideAlerts();

    //venue.getUnapprovedVenues();
    venue.loadVenueTypes();
    venue.loadCountries();
    events.getPrivateEvents();
    events.getBusinessEvents();

    // Update Place Info
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
            street1: {
                required: true
            },
            zipcode: {
                required: true,
                number: true
            },
            pbox: {
                required: true,
                digits: true,
                maxlength: 6
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
            street1: {
                required: "This field is required."
            },
            zipcode: {
                number: "Please enter valid Zip Code"
            },
            pbox: {
                required: "This field is required."
            }
        },
        submitHandler: function (form) {
            venue.addPlace();
        }
    });
    // End

    venue.addContactFormValidation();
    venue.addPlaceDescriptionFormValidation();

    //venue.addOpenAreasImage();

    // Add Venue Name
    $('#frmAddVenue').validate({
        rules: {
            venuename: {
                required: true
            }
        },
        messages: {
            venuename: {
                required: "This field is required."
            }
        },
        submitHandler: function (form) {
            var antiforgerytoken = $('input[name=__RequestVerificationToken]').val();
            var hostid = $('#hostid').val();
            var venuename = $('#venuename').val();
            var status = 0;

            venue.addVenueName(antiforgerytoken, hostid, venuename, status);
        }
    });
    // End

    // Update Host Email
    $('#frmUpdateEmail').validate({
        rules: {
            currentuseremail: {
                required: true
            }
        },
        messages: {
            currentuseremail: {
                required: "This field is required."
            }
        },
        submitHandler: function (form) {
            var forgerytoken = $('input[name=__RequestVerificationToken]').val();
            var hostid = $('#currentuserid').val();
            var venueid = parseInt($('#venueid').val());
            var email = $('#currentuseremail').val();

            host.updateHostEmail(forgerytoken, hostid, venueid, email);
        }
    });
    // End

    // Upload Business Certificate
    $('#btnAddBusinessCert').click(function () {
        var checkbox = $('#venuelist').find('tr td input[type=checkbox]');

        $.each(checkbox, function (index, value) {
            var isChecked = $(value).is(':checked');

            if (isChecked) {
                var venueid = $(value).attr('value');

                $('#venueId').val(venueid);

                return false;
            }
        });
    });

    $('#frmAddBusinessCert').validate({
        rules: {
            BusinessCert: {
                required: true
            }
        },
        messages: {
            BusinessCert: {
                required: "This field is required."
            }
        },
        submitHandler: function (form) {
            var file = $('#BusinessCert').val().split('.').pop().toLowerCase();

            if (file == 'jpg' || file == 'pdf') {
                var venueid = parseInt($('#venueId').val());

                certificates.uploadBusinessCertificate(venueid);
            }
            else {
                alert("Must upload JPG or PDF file.");
            }
        }
    });
    // End

    // Display pending venues notificaion
    $.ajax({
        type: "GET",
        url: "/Venue/GetUnapprovedVenuesCountPerHost",
        data: { hostid: $('#hostid').val() },
        success: function (result) {
            if (result.count > 0) {
                $('#alert-pending-venue-approval').show(function () {
                    $(this).slideDown();
                });
            }
            else {
                $('#alert-place-characterization').hide();
            }
        },
        error: function (error) {
            console.log(error);
        }
    });
    // End

    $('#seasonactivity').change(function () {
        var val = $(this).val();

        if (val == "Seasonal")
            $('#seasonal').show();
        else
            $('#seasonal').hide();
    });

    // MAIN - CHARACTERIZATION OF PLACE
    // Venue Structure
    $('#drpVenueStructure').change(function () {
        var val = $(this).val();

        if (val == "Select") {
            $('#VenueStructure').prop("disabled", true);
            $('#VenueStructure').val("");
        }
        else {
            $('#VenueStructure').prop("disabled", false);
        }
    });

    $('#VenueStructure').change(function () {
        var value = $(this).val();

        if (value != '' || value != null) {
            var fileExtension = $('#VenueStructure').val().split('.').pop().toLowerCase();
            var optionValue = $('#drpVenueStructure option:selected').text();

            if (fileExtension != 'jpg' || optionValue == "Select") {
                alert("Please a select an option or upload JPG image");
            }
            else {
                venue.uploadVenueStructureImage();
                venue.saveVenueStructureInfo();
            }
        }
    });
    // End

    // A View
    $('#drpAViewOption').change(function () {
        var val = $(this).val();

        if (val == "Select") {
            $('#AView').prop("disabled", true);
            $('#AView').val("");
        }
        else if (val == "N/A") {
            venue.saveAViewInfo();

            $('#AView').prop("disabled", true);
        }
        else {
            $('#AView').prop("disabled", false);
        }
    });

    $('#AView').change(function () {
        var fileExtension = $(this).val().split('.').pop().toLowerCase();
        var optionValue = $('#drpAViewOption option:selected').text();

        if (fileExtension != 'jpg' || optionValue == "Select") {
            alert("Please a select an option or upload JPG image");
        }
        else {
            venue.uploadAViewImage();
            venue.saveAViewInfo();
        }
    });
    // End

    // Max # of Rooms/Areas/Enclosures
    $('#frmAddRoomsAreasEnclosure').submit(function (event) {
        event.preventDefault();

        var optionValue = $('#drpMaxRoomsAreasOption').val();

        if (optionValue == "Select")
            alert("Must select value.");
        else
            venue.saveMaxRoomsAreasEnclosures();
    });
    // End

    // Privacy
    $('#drpPrivacyOption').change(function () {
        var val = $(this).val();

        if (val == "Select") {
            $('#Privacy').prop("disabled", true);
            $('#Privacy').val("");
        }
        else if (val == "N/A") {
            venue.savePrivacyInfo();

            $('#Privacy').prop("disabled", true);
        }
        else {
            $('#Privacy').prop("disabled", false);
        }
    });

    $('#Privacy').change(function () {
        var fileExtension = $(this).val().split('.').pop().toLowerCase();
        var optionValue = $('#drpPrivacyOption option:selected').text();
        var image = $(this).val();

        if (fileExtension != 'jpg' || optionValue == "Select" || image == '') {
            alert("Please a select an option or upload JPG image");
        }
        else {
            venue.uploadPrivacyImage();
            venue.savePrivacyInfo();
        }
    });
    // End

    // Pillars
    $('#drpPillarsOption').change(function () {
        var val = $(this).val();

        if (val == "Select") {
            $('#Pillars').prop("disabled", true);
            $('#Pillars').val("");
        }
        else if (val == "No" || val == "N/A") {
            venue.savePillarsInfo();

            $('#Pillars').prop("disabled", true);
        }
        else {
            $('#Pillars').prop("disabled", false);
        }
    });

    $('#Pillars').change(function () {
        var fileExtension = $(this).val().split('.').pop().toLowerCase();
        var optionValue = $('#drpPillarsOption option:selected').text();
        var image = $(this).val();

        if (fileExtension != 'jpg' || optionValue == "Select" || image == '') {
            alert("Please a select an option or upload JPG image");
        }
        else {
            venue.uploadPillarsImage();
            venue.savePillarsInfo();
        }
    });
    // End
    // END



    // ADMINISTRATIVE - CERTIFICATES
    $('#frmAddTermsCert').submit(function (event) {
        event.preventDefault();
        
        certificates.addTermsAndConditionsCertificate();
    });

    $('#BusinessLicOption').change(function () {
        var val = $(this).val();

        if (val == "UpToDate") {
            $('#BusinessLicense').prop("disabled", false);
        }
        else {
            $('#BusinessLicense').prop("disabled", true);
            $('#BusinessLicense').val("");
        }
    });

    $('#frmAddBusinessLic').submit(function (event) {
        event.preventDefault();

        certificates.addBusinessLicense();
    });

    $('#PoliceAuthOption').change(function () {
        var val = $(this).val();

        if (val == "UpToDate") {
            $('#PoliceAuth').prop("disabled", false);
        }
        else {
            $('#PoliceAuth').prop("disabled", true);
            $('#PoliceAuth').val("");
        }
    });

    $('#frmAddPoliceAuthCert').submit(function (event) {
        event.preventDefault();

        certificates.addPoliceAuthorization();
    });

    $('#FireDeptOption').change(function () {
        var val = $(this).val();

        if (val == "UpToDate") {
            $('#FireDeptCert').prop("disabled", false);
        }
        else {
            $('#FireDeptCert').prop("disabled", true);
            $('#FireDeptCert').val("");
        }
    });

    $('#frmAddFireDeptCert').submit(function (event) {
        event.preventDefault();

        certificates.addFireDeptCertificate();
    });

    $('#SanitationOption').change(function () {
        var val = $(this).val();

        if (val == "UpToDate") {
            $('#SanitationCert').prop("disabled", false);
        }
        else {
            $('#SanitationCert').prop("disabled", true);
            $('#SanitationCert').val("");
        }
    });

    $('#frmAddSanitationCert').submit(function (event) {
        event.preventDefault();

        certificates.addSanitationCertificate();
    });

    $('#ThirdPtInsuranceOption').change(function () {
        var val = $(this).val();

        if (val == "UpToDate") {
            $('#ThirdPartyInsurance').prop("disabled", false);
        }
        else {
            $('#ThirdPartyInsurance').prop("disabled", true);
            $('#ThirdPartyInsurance').val("");
        }
    });

    $('#frmAddThirdPtInsurance').submit(function (event) {
        event.preventDefault();

        certificates.addThirdPartyInsuranceCertificate();
    });
    // END
});