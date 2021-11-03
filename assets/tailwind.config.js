const colors = require('tailwindcss/colors')

module.exports = {
  mode: 'jit',
  purge: {
    enabled: process.env.NODE_ENV === "production",
    content: [
      "./js/**/*.js",
      "../lib/**/*.ex",
      "../lib/**/*.eex",
      "../lib/**/*.leex",
      "../lib/**/*.heex",
      "../lib/**/*_view.ex"
    ],
    options: {
      whitelist: [/phx/, /topbar/]
    }
  },
  // darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      // colors: {
      //   'light-blue': colors.lightBlue,
      //   cyan: colors.cyan,
      //   indigo: colors.indigo
      // },
    },
  },
  variants: {
    extend: {},
  },
  plugins: [
    require('@tailwindcss/typography'),
    // require('@tailwindcss/forms')
  ],
}
