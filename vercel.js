{
  "version": 2,
  "builds": [
    {
      "src": "api/*.js",
      "use": "@vercel/node"
    }
  ],
  "routes": [
    {
      "src": "/api/(.*)",
      "dest": "/api/$1"
    },
    {
      "src": "/checkpoint1.html",
      "dest": "/checkpoint1.html"
    },
    {
      "src": "/checkpoint2.html",
      "dest": "/checkpoint2.html"
    },
    {
      "src": "/",
      "dest": "/index.html"
    }
  ]
}
