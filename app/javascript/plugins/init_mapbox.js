
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
const mapMarkers = []
  markers.forEach((marker) => {
    // Create a HTML element for your custom marker

     const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);


     const newMarker = new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
      mapMarker.push(newMarker)
      mapMarkers.push(newMarker)
      // We use the "getElement" funtion provided by mapbox-gl to access to the marker's HTML an set an id
      newMarker.getElement().dataset.markerId = marker.id;
      // Put a microphone on the new marker listening for a mouseenter event
      newMarker.getElement().addEventListener('mouseenter', (e) => toggleCardHighlighting(e) );
      // We put a microphone on listening for a mouseleave event
      newMarker.getElement().addEventListener('mouseleave', (e) => toggleCardHighlighting(e) );

  });
}

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  let NorthWest = bounds.getNorthWest()
    let West = bounds.getWest()
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
 map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 0 });
};

const openInfoWindow = (markers) => {
  // Select all cards
  const cards = document.querySelectorAll('.card');
  cards.forEach((card, index) => {
    // Put a microphone on each card listening for a mouseenter event
    card.addEventListener('mouseenter', () => {
      // Here we trigger the display of the corresponding marker infoWindow with the "togglePopup" function provided by mapbox-gl
      markers[index].togglePopup();
    });
    // We also put a microphone listening for a mouseleave event to close the modal when user doesn't hover the card anymore
    card.addEventListener('mouseleave', () => {
      markers[index].togglePopup();
    });
  });
}

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
      openInfoWindow(mapMarkers);
      const toggleCardHighlighting = (event) => {
  // We select the card corresponding to the marker's id
  const card = document.querySelector(`[data hotel-id="${event.currentTarget.dataset.markerId}"]`);
  // Then we toggle the class "highlight github" to the card
  card.classList.toggle('highlight');
}

  }

};
export { initMapbox };
