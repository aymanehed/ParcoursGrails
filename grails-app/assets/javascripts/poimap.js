function initMap(callback) {
    const options = {
        zoom: 8,
        center: {lat: 33.589886, lng: -7.603869}
    }
    const Map = new google.maps.Map(document.getElementById("map"), options);
    let currentMarker = new google.maps.Marker({
        map: Map,
        position: options.center,
        title: "Hello World!"
    });

    Map.addListener("click", (event) => {
        currentMarker.setMap(null);

        currentMarker = new google.maps.Marker({
            map: Map,
            position: event.latLng,
            title: "Hello World!"
        });

        let latInput = document.getElementById("lat");
        let lngInput = document.getElementById("lng");
        console.log("Latitude:", parseFloat(event.latLng.lat()));
        console.log("Longitude:", parseFloat(event.latLng.lng()));
        latInput.value = event.latLng.lat();
        lngInput.value = event.latLng.lng();
    });
}
