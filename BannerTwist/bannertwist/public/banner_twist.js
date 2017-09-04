(function() {

    var HOST = 'localhost'
    var BANNER_URI = 'http://' + HOST + ':3000/'

    // Function make ajax GET call on uri, callback recieved by callback_generator function
    function ajax_exec(uri, callback_generator) {
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("GET", uri);
        xmlhttp.setRequestHeader('Host', HOST)
        xmlhttp.setRequestHeader('Origin', window.location.hostname)
        xmlhttp.onreadystatechange = callback_generator(xmlhttp)
        xmlhttp.send();
    }

    // Launch appi call to 'banner_site/next_banner' and regester callback for it
    function show_next_banner(banner_id_param) {
        ajax_exec(BANNER_URI + 'banner_site/next_banner?banner_site_id=' + banner_id_param, create_banner_proc_func)
    }

    // Callback generarator for show banner funtion
    // result function exec when 'show next banner' call response.
    // Function print banner and launch next 'show next banner' function
    function create_banner_proc_func(xmlhttp) {
        return function() {
            if (xmlhttp.readyState == 4) {
                if (xmlhttp.status == 200) {
                    if (xmlhttp.responseText == "{}") {
                        return
                    }
                    response = JSON.parse(xmlhttp.responseText)
                    print_banner(response.uri, response.link, response.baner_site_id)
                    setTimeout(function() {
                        show_next_banner(response.baner_site_id)
                    }, response.show_time)
                } else {
                    console.log('error in showing next banner')
                }
            }
        }
    }

    //Callback generarator for click funtion
    //function create_click_proc_func(xmlhttp) {
    //    return function() {
    //        if (xmlhttp.readyState == 4) {
    //            console.log(xmlhttp.status);
    //        }
    //    }
    //}

    // Functon print banner on current page
    // banner var image defined earlie
    // add onclick function to banner
    function print_banner(uri, link, banner_site_id) {
        image.src = uri;

        // be aware memory lick
        image.onclick = function() {
            ajax_exec(BANNER_URI + '/banner_site/add_click?banner_site_id=' + banner_site_id,
                function() {})
            var win = window.open(link, '_blank');
            win.focus();
        }
    }

    //Function create empty banner on current page 
    function create_image() {
        image = document.createElement("img");
        var imageParent = document.getElementsByTagName("body")[0];
        image.id = "banner_twist_id"
        image.style.maxHeight = '150px';
        image.style.top = '0px';
        image.style.left = '0px';
        image.style.position = 'absolute';
        image.style.zIndex = 10000;
        imageParent.appendChild(image);
    }

    // Start script execution
    // Get image banner by "banner_twist_id"
    image = document.getElementById("banner_twist_id")
        // If image banner absent create it
    if (image == null) {
        create_image()
    }
    //init call
    ajax_exec(BANNER_URI + 'banner_site/init_banner_site', create_banner_proc_func)
})()