// vite.config.js
import { defineConfig } from "file:///C:/laragon/www/Shahispace/QuickMoveHomes/node_modules/vite/dist/node/index.js";
import laravel from "file:///C:/laragon/www/Shahispace/QuickMoveHomes/node_modules/laravel-vite-plugin/dist/index.js";
import vue from "file:///C:/laragon/www/Shahispace/QuickMoveHomes/node_modules/@vitejs/plugin-vue/dist/index.mjs";
import path from "path";
var __vite_injected_original_dirname = "C:\\laragon\\www\\Shahispace\\QuickMoveHomes";
var vite_config_default = defineConfig({
  plugins: [
    laravel(
      // ['resources/js/app.js']
      {
        input: [
          "resources/sass/app.scss",
          "resources/js/app.js"
        ],
        refresh: true
      }
    ),
    vue({
      template: {
        transformAssetUrls: {
          // The Vue plugin will re-write asset URLs, when referenced
          // in Single File Components, to point to the Laravel web
          // server. Setting this to `null` allows the Laravel plugin
          // to instead re-write asset URLs to point to the Vite
          // server instead.
          base: null,
          // The Vue plugin will parse absolute URLs and treat them
          // as absolute paths to files on disk. Setting this to
          // `false` will leave absolute URLs un-touched so they can
          // reference assets in the public directory as expected.
          includeAbsolute: false
        }
      }
    })
  ],
  resolve: {
    alias: {
      vue: "vue/dist/vue.esm-bundler.js",
      "@components": path.resolve(__vite_injected_original_dirname, "resources/js/components")
    }
  }
});
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsidml0ZS5jb25maWcuanMiXSwKICAic291cmNlc0NvbnRlbnQiOiBbImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCJDOlxcXFxsYXJhZ29uXFxcXHd3d1xcXFxTaGFoaXNwYWNlXFxcXFRyYXZlY2F0aW9uc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9maWxlbmFtZSA9IFwiQzpcXFxcbGFyYWdvblxcXFx3d3dcXFxcU2hhaGlzcGFjZVxcXFxUcmF2ZWNhdGlvbnNcXFxcdml0ZS5jb25maWcuanNcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfaW1wb3J0X21ldGFfdXJsID0gXCJmaWxlOi8vL0M6L2xhcmFnb24vd3d3L1NoYWhpc3BhY2UvVHJhdmVjYXRpb25zL3ZpdGUuY29uZmlnLmpzXCI7aW1wb3J0IHsgZGVmaW5lQ29uZmlnIH0gZnJvbSBcInZpdGVcIjtcbmltcG9ydCBsYXJhdmVsIGZyb20gXCJsYXJhdmVsLXZpdGUtcGx1Z2luXCI7XG5pbXBvcnQgdnVlIGZyb20gXCJAdml0ZWpzL3BsdWdpbi12dWVcIjtcbmltcG9ydCBwYXRoIGZyb20gJ3BhdGgnO1xuXG5leHBvcnQgZGVmYXVsdCBkZWZpbmVDb25maWcoe1xuICAgIHBsdWdpbnM6IFtcbiAgICAgICAgbGFyYXZlbChcbiAgICAgICAgICAgIC8vIFsncmVzb3VyY2VzL2pzL2FwcC5qcyddXG4gICAgICAgICAgICB7XG4gICAgICAgICAgICAgICAgaW5wdXQ6IFtcbiAgICAgICAgICAgICAgICAgICAgXCJyZXNvdXJjZXMvc2Fzcy9hcHAuc2Nzc1wiLFxuICAgICAgICAgICAgICAgICAgICBcInJlc291cmNlcy9qcy9hcHAuanNcIixcbiAgICAgICAgICAgICAgICBdLFxuICAgICAgICAgICAgICAgIHJlZnJlc2g6IHRydWUsXG4gICAgICAgICAgICB9XG4gICAgICAgICksXG4gICAgICAgIHZ1ZSh7XG4gICAgICAgICAgICB0ZW1wbGF0ZToge1xuICAgICAgICAgICAgICAgIHRyYW5zZm9ybUFzc2V0VXJsczoge1xuICAgICAgICAgICAgICAgICAgICAvLyBUaGUgVnVlIHBsdWdpbiB3aWxsIHJlLXdyaXRlIGFzc2V0IFVSTHMsIHdoZW4gcmVmZXJlbmNlZFxuICAgICAgICAgICAgICAgICAgICAvLyBpbiBTaW5nbGUgRmlsZSBDb21wb25lbnRzLCB0byBwb2ludCB0byB0aGUgTGFyYXZlbCB3ZWJcbiAgICAgICAgICAgICAgICAgICAgLy8gc2VydmVyLiBTZXR0aW5nIHRoaXMgdG8gYG51bGxgIGFsbG93cyB0aGUgTGFyYXZlbCBwbHVnaW5cbiAgICAgICAgICAgICAgICAgICAgLy8gdG8gaW5zdGVhZCByZS13cml0ZSBhc3NldCBVUkxzIHRvIHBvaW50IHRvIHRoZSBWaXRlXG4gICAgICAgICAgICAgICAgICAgIC8vIHNlcnZlciBpbnN0ZWFkLlxuICAgICAgICAgICAgICAgICAgICBiYXNlOiBudWxsLFxuXG4gICAgICAgICAgICAgICAgICAgIC8vIFRoZSBWdWUgcGx1Z2luIHdpbGwgcGFyc2UgYWJzb2x1dGUgVVJMcyBhbmQgdHJlYXQgdGhlbVxuICAgICAgICAgICAgICAgICAgICAvLyBhcyBhYnNvbHV0ZSBwYXRocyB0byBmaWxlcyBvbiBkaXNrLiBTZXR0aW5nIHRoaXMgdG9cbiAgICAgICAgICAgICAgICAgICAgLy8gYGZhbHNlYCB3aWxsIGxlYXZlIGFic29sdXRlIFVSTHMgdW4tdG91Y2hlZCBzbyB0aGV5IGNhblxuICAgICAgICAgICAgICAgICAgICAvLyByZWZlcmVuY2UgYXNzZXRzIGluIHRoZSBwdWJsaWMgZGlyZWN0b3J5IGFzIGV4cGVjdGVkLlxuICAgICAgICAgICAgICAgICAgICBpbmNsdWRlQWJzb2x1dGU6IGZhbHNlLFxuICAgICAgICAgICAgICAgIH0sXG4gICAgICAgICAgICB9LFxuICAgICAgICB9KSxcbiAgICBdLFxuICAgIHJlc29sdmU6IHtcbiAgICAgICAgYWxpYXM6IHtcbiAgICAgICAgICAgIHZ1ZTogXCJ2dWUvZGlzdC92dWUuZXNtLWJ1bmRsZXIuanNcIixcbiAgICAgICAgICAgICdAY29tcG9uZW50cyc6IHBhdGgucmVzb2x2ZShfX2Rpcm5hbWUsICdyZXNvdXJjZXMvanMvY29tcG9uZW50cycpLFxuICAgICAgICB9LFxuICAgIH0sXG59KTtcbiJdLAogICJtYXBwaW5ncyI6ICI7QUFBOFMsU0FBUyxvQkFBb0I7QUFDM1UsT0FBTyxhQUFhO0FBQ3BCLE9BQU8sU0FBUztBQUNoQixPQUFPLFVBQVU7QUFIakIsSUFBTSxtQ0FBbUM7QUFLekMsSUFBTyxzQkFBUSxhQUFhO0FBQUEsRUFDeEIsU0FBUztBQUFBLElBQ0w7QUFBQTtBQUFBLE1BRUk7QUFBQSxRQUNJLE9BQU87QUFBQSxVQUNIO0FBQUEsVUFDQTtBQUFBLFFBQ0o7QUFBQSxRQUNBLFNBQVM7QUFBQSxNQUNiO0FBQUEsSUFDSjtBQUFBLElBQ0EsSUFBSTtBQUFBLE1BQ0EsVUFBVTtBQUFBLFFBQ04sb0JBQW9CO0FBQUE7QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBLFVBTWhCLE1BQU07QUFBQTtBQUFBO0FBQUE7QUFBQTtBQUFBLFVBTU4saUJBQWlCO0FBQUEsUUFDckI7QUFBQSxNQUNKO0FBQUEsSUFDSixDQUFDO0FBQUEsRUFDTDtBQUFBLEVBQ0EsU0FBUztBQUFBLElBQ0wsT0FBTztBQUFBLE1BQ0gsS0FBSztBQUFBLE1BQ0wsZUFBZSxLQUFLLFFBQVEsa0NBQVcseUJBQXlCO0FBQUEsSUFDcEU7QUFBQSxFQUNKO0FBQ0osQ0FBQzsiLAogICJuYW1lcyI6IFtdCn0K
