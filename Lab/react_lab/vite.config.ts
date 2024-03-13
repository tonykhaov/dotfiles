/// <reference types="vitest" />

import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react-swc'
import tsconfigPaths from 'vite-tsconfig-paths'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), tsconfigPaths()],
  // vitest config
  test: {
    // https://vitest.dev/config/
    environment: "jsdom",
    globals: true,
    setupFiles: './src/utils/test/setupFiles.ts',
  },
})
