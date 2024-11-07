'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "492a1b4b3228d147cdf58761ca0d27a5",
"assets/AssetManifest.bin.json": "a27a71c35cc576f0ee612a8fa5217ed4",
"assets/AssetManifest.json": "b1f8b6c0e987a8ca92cc9aba871830c4",
"assets/assets/images/Cate1.png": "4ad5f179aa2682cb175e860cddd9c3bb",
"assets/assets/images/Folder.png": "b396cfc938dac1446583ab70bdd6fcf5",
"assets/assets/images/image1.gif": "558bec4fba04aa4289fe65afc35a7311",
"assets/assets/images/image2.png": "af3da0dbb92f5a04fecbe73d975e08b5",
"assets/assets/images/PageView.jpeg": "3aad289fd76715c4545920b6dd632393",
"assets/assets/Package/animation1.gif": "a39185de5ab04207e71eb5dfcd936240",
"assets/assets/Package/DayNight/cloud.png": "7a83b6c53ffe3c14de620235817191b0",
"assets/assets/Package/DayNight/day.png": "a911fba0a472d73df037f9f1b39c1ce4",
"assets/assets/Package/DayNight/moon.png": "d03b9f65277bfc3a5ef8a2762882caf1",
"assets/assets/Package/DayNight/night.png": "3d185dc3f301345d0d3aa3d74ea5f6c1",
"assets/assets/Package/DayNight.gif": "d7aa687feda66deb51a8bd2e7d2041a4",
"assets/assets/Package/gap.png": "4631ebc79ba341bd965469269022534a",
"assets/assets/Package/pdfviewer.jpg": "16bf523339a27afcad0d6c714154d33d",
"assets/assets/Package/Scratcher.gif": "1c5e3a9942b72b9214514bbc9d8dd716",
"assets/assets/Package/webview_flutter.jpg": "5318addc89e39eccdc0e8a4b7d2d6cd3",
"assets/assets/Popup/Popup1.jpeg": "443cafd01989496db0fcbf27cfe73727",
"assets/assets/Santa.gif": "af2f40bd0fa0b7f44edc4ecbdd813081",
"assets/assets/Templates/login.png": "274b1bdcd18da497307c7aacab63e180",
"assets/assets/Templates/Netflix_design.jpeg": "60997c05b0468d72259d5374fdef1f97",
"assets/assets/Widget_img/Colorhex.jpeg": "4eb59ee177ed812f76c7ee75576df2a0",
"assets/assets/Widget_img/Expan1.jpeg": "6273591d661d30a6ea6ad8a76b8ea6d1",
"assets/assets/Widget_img/Grid.jpeg": "becc80030a0fbaf622c166219a1a68ca",
"assets/assets/Widget_img/ListTile.jpeg": "865d7daef58e0a6ac131507a1f6a0ef8",
"assets/assets/Widget_img/Tab.jpeg": "ad0e610956e3153dbce0f6289dd5bba8",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "f6276778378b9f6ef7605088537c7da2",
"assets/NOTICES": "bb7c322462f64cfad31c97bb2941a17d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "f134c7b76931fee5741ec681b700ccd7",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b1450655da96f2238bf70793fd10b187",
"/": "b1450655da96f2238bf70793fd10b187",
"main.dart.js": "a17517f2188ac64061b10b5dc39be76d",
"manifest.json": "5b4e418b83235ca7b944bf9552ac2c11",
"version.json": "713b62a8b71d47b6c22f360eb85773d2"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
