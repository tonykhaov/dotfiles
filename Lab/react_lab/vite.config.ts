/// <reference types="vitest" />

import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tsconfigPaths from 'vite-tsconfig-paths'
import Unocss from 'unocss/vite'
import presetWind from '@unocss/preset-wind'

import 'dotenv/config'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react(), Unocss({ presets: [presetWind()] }), tsconfigPaths()],
  // vitest config
  test: {
    // https://vitest.dev/config/
    globals: true,
    setupFiles: './src/utils/test/setupFiles.ts',
  },
})
