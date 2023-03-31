$(document).ready(function() {
    $("#register").hover(function() {
        $("#register").css("background-color", "orangered");
    });

    $("#register").mouseleave(function() {
        $("#register").css("background-color", "#0FA958");
    });

    $("#register").click(function() {
        $("#register").css("background-color", "#0071F2");
        location.href = "section1.html";
    });

    ////////////////////////////////// NAME, EMAIL, COUNTRY, REGION, HOURS, PHONE, WEBSITE


    var name, email, country, region, hours, phone, website;

    $("#mouseOne").hover(function() {
        name = $("#name").val();
        email = $("#email").val();
        country = $("#country").val();
        console.log(country);
        region = $("#region").val();
        hours = $("#hours").val();
        phone = $("#phone").val();
        console.log(phone);
        website = $("#website").val();
        if (!name) {
            $(".name .alert1").removeClass("hidden");
        }
        if (!email) {
            $(".email .alert1").removeClass("hidden");
        }
        if (!country) {
            $(".country .alert1").removeClass("hidden");
        }
        if (!region) {
            $(".region .alert1").removeClass("hidden");
        }
        if (!hours) {
            $(".hours .alert1").removeClass("hidden");
        }
        if (!phone || isNaN(phone) || phone.length < 10) {
            $(".phone .alert1").removeClass("hidden");
        }
        if (!website) {
            $(".website .alert1").removeClass("hidden");
        }
        
        if(name && email && phone && country && website && hours && country && region) {
            $(".fa-computer-mouse").css("color", "#FFBF00");
            location.href = "section2.html";
        }
    });



    ///////////////////////////////// SERVICES

    var services = ['Accident and emergency (A&E)', 'Burns Unit', 'Cardiology', 'Coronary Care Unit (CCU)', 'Critical Care/Intensive Care Unit (ICU)', 'Dentistry', 'Endoscopy', 'Elderly Services', 'Gastroenterology', 'General Surgery', 'Gynecology & Obstetrics', 'Hematology', 'Internal Medicine', 'Maternity', 'Microbiology', 'Neonatal', 'Nephrology', 'Neurology', 'Nutrition and Dietetics', 'Occupational Therapy (OT)', 'Oncology', 'Ophthalmology', 'Orthopedics', 'Otolaryngology (Ear_Nose_Throat)', 'Paediatrics', 'Pharmacy', 'Physiotherapy', 'Psychiatry', 'Radiology', 'Radiotherapy', 'Renal', 'Rheumatology', 'Urology'];
    for (var i = 0; i < services.length; i++) {
        var service = services[i];
        $(".services").append("<button class='service'>" + service + "</button>").find('button:last').addClass(i.toString());
    }

    // SELECTED SERVICES
    var selectedServices = [];

    $(".service").click(function() {
        if ($(this).hasClass("selected")) {
            var serviceNumber = $(this).attr('class').split(' ')[1];
            var service = $("." + serviceNumber).text();
            console.log("unselected: " + service);
            selectedServices.splice(selectedServices.indexOf(service), 1);
            $("." + serviceNumber).css({"background-color":"#fff", "color":"#0071F2"}).removeClass("selected");
        } else {
        var serviceNumber = $(this).attr('class').split(' ')[1];
        var service = $("." + serviceNumber).text();
        console.log(service);
        selectedServices.push(service);
        $("." + serviceNumber).css({"background-color":"#0071F2", "color":"#fff"}).addClass("selected");
        }
        console.log(selectedServices);
    });

    //ON PREVIOUS
    $("#previous").click(function() {
        location.href = "section1.html";
    });


    //ON SUBMIT
    $("#submit").click(function() {
        if (selectedServices.length == 0) {
            $(".alert2").removeClass("hidden");
        } else {
            addHospital();
        }
    });

    var host = "https://global-hospitals.onrender.com/api/v1/hospitals/";

    function addHospital() {
        var data = {
            "email": email,
            "name": name,
            "country": country,
            "region": region,
            "operating hours": hours,
            "phone": phone,
            "services": selectedServices,
            "website": website
        };
        $.ajax({
            type: "POST",
            url: host + "new",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function(data) {
                data = JSON.parse(data);
                if(data !="") {
                    //history.go(-1);
                    $(".error").removeClass("hidden").append(data.toString());
                    setTimeout(reloadOne, 2000);
                } else {
                    location.href = "exit.html";
                }
            },
            error: function(data) {
                console.log(data);
            }
        });
    }

    function reloadOne() {
        location.href = "section1.html";
    }
});
