// broodwar.live — retired service worker.
//
// An earlier version of the site registered a service worker that precached
// routes which no longer exist. The static site does not need one, so this
// worker removes itself: it clears every cache it created, unregisters, and
// reloads open tabs so they are served straight from the network again.
// Keep this file deployed at /sw.js until old installs have had time to update.

self.addEventListener("install", () => self.skipWaiting())

self.addEventListener("activate", (event) => {
  event.waitUntil((async () => {
    const keys = await caches.keys()
    await Promise.all(keys.map((key) => caches.delete(key)))
    await self.registration.unregister()
    const clients = await self.clients.matchAll({type: "window"})
    clients.forEach((client) => client.navigate(client.url))
  })())
})
