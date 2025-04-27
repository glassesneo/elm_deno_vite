import { defineConfig } from "vite";
import deno from "@deno/vite-plugin";
import elmPlugin from "vite-plugin-elm";

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    deno(),
    elmPlugin(),
  ],
});
