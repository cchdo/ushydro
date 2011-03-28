google.setOnLoadCallback(function () {
  jQuery.noConflict();
  jQuery(function ($) {
    var gm = google.maps;
    var map = new gm.Map2(document.getElementById('map'));
    var bounds;
    map.setMapType(G_SATELLITE_MAP);
    map.setUIToDefault();
    $.ajax({
        type: 'GET',
        url: '/progress/positions',
        datatype: 'json',
        success: function (data) {
          var track = data.map(function (pos) {
            return new gm.LatLng(pos.position.latitude, pos.position.longitude);
          });
          var polyline = new gm.Polyline(track, '#ADD8E6', 3, 1);
          bounds = polyline.getBounds();
          map.addOverlay(polyline);
          map.setCenter(bounds.getCenter(), map.getBoundsZoomLevel(bounds));
        }
    });
    $.ajax({
        type: 'GET',
        url: '/progress/posts',
        datatype: 'json',
        success: function (data) {
          data.map(function (postContainer) {
            var post = postContainer.post;
            var pos = new gm.LatLng(post.latitude, post.longitude);
            var placemark = new gm.Marker(pos, {title: post.post_date});

            placemark.desc = post.excerpt + '<span class="newer"><a href="/blog/' +
                post.post_type + '/' +
                post.post_date + '">Read more</a></span>';
            gm.Event.addListener(placemark, 'click', function () {
              this.openInfoWindowHtml(this.desc, {maxWidth: 400});
            });

            map.addOverlay(placemark);
            bounds.extend(pos);
          });
          map.setCenter(bounds.getCenter(), map.getBoundsZoomLevel(bounds));
        }
    });
  });
});
