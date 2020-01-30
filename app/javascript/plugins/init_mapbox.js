
import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    duration: 0.8,
    pitch:85,
    center: [151.2205038,-33.8499252],
    zoom: 6,


  });
}
const addControl = (map) => {
  map.addControl(
new mapboxgl.GeolocateControl({
positionOptions: {
enableHighAccuracy: true
},

trackUserLocation: true
})
);
}



const addMarkersTo = (map, markers) => {

  markers.forEach((marker) => {
    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundPosition = 'center';
    element.style.backgroundRepeat = 'no-repeat';
    element.style.backgroundSize = 'contain';
    element.style.width = '35px';
    element.style.height = '35px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);

  });
}

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
 map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};

const initMapbox = () => {
  if (mapElement) {
    // Build map
    const map = buildMap();
    const position = addControl(map);
    // Add Markers
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersTo(map, markers);

    // Fit to markers
    fitMapToMarkers(map, markers);
     addControl(map);

  }

};
export { initMapbox };
