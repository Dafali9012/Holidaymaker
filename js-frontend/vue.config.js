module.exports = {
  devServer: {
    proxy: {
      '^/rest': {
        target: 'http://localhost:8080',
        ws: true,
        changeOrigin: true,
      },
      '^/login': {
        target: 'http://localhost:8080',
        ws: true,
        changeOrigin: true,
      },
      '^/api': {
        target: 'http://localhost:8080',
        ws: true,
        changeOrigin: true,
      },
    },
  },
}