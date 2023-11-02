const mix = require('laravel-mix');
const glob = require('glob');
const path = require('path');
const ReplaceInFileWebpackPlugin = require('replace-in-file-webpack-plugin');
const rimraf = require('rimraf');
require('laravel-mix-copy-watched');

mix.browserSync({
    host: 'suzuki.test',
    proxy: 'suzuki.test',
    open: 'external'
});

// Global jquery
// mix.autoload({
// 'jquery': ['$', 'jQuery'],
// Popper: ['popper.js', 'default'],
// });

if (!mix.inProduction()) {
    mix.webpackConfig({
        devtool: 'source-map'
    })
        .sourceMaps()
}

// 3rd party plugins css/js
mix.sass('resources/plugins/plugins.scss', 'public/plugins/global/plugins.bundle.css')
    .options({processCssUrls: false})
    // .sourceMaps()
    .js(['resources/plugins/plugins.js'], 'public/plugins/global/plugins.bundle.js');

// Metronic css/js
mix.sass('resources/metronic/sass/style.scss', 'public/css/style.bundle.css', {
    sassOptions: {includePaths: ['node_modules']},
// }).sourceMaps()
})
    // .options({processCssUrls: false})
    .js('resources/js/scripts.js', 'public/js/scripts.bundle.js');

// Custom 3rd party plugins
// (glob.sync('resources/plugins/custom/**/*.js') || []).forEach(file => {
//     mix.js(file, `public/${file.replace('resources/', '').replace('.js', '.bundle.js')}`);
// });
// (glob.sync('resources/plugins/custom/**/*.scss') || []).forEach(file => {
//     mix.sass(file, `public/${file.replace('resources/', '').replace('.scss', '.bundle.css')}`);
// });

// Default
mix.js('resources/js/app.js', 'public/js')
    .js('resources/js/backend.js', 'public/js')
    .scripts('resources/js/config.js', 'public/js/config.js')
    .sass('resources/sass/app.scss', 'public/css')
    .sass('resources/sass/backend.scss', 'public/css');

// // Metronic css pages (single page use)
// (glob.sync('resources/metronic/sass/pages/**/!(_)*.scss') || []).forEach(file => {
//     file = file.replace(/[\\\/]+/g, '/');
//     mix.sass(file, file.replace('resources/metronic/sass', 'public/css').replace(/\.scss$/, '.css'));
// });

// Metronic js pages (single page use)
// (glob.sync('resources/metronic/js/pages/**/*.js') || []).forEach(file => {
//     mix.js(file, `public/${file.replace('resources/metronic/', '')}`);
// });

// Metronic media
mix.copyDirectory('resources/images', 'public/images');

// Metronic theme
(glob.sync('resources/metronic/sass/themes/**/!(_)*.scss') || []).forEach(file => {
    file = file.replace(/[\\\/]+/g, '/');
    mix.sass(file, file.replace('resources/metronic/sass', 'public/css').replace(/\.scss$/, '.css'));
});

mix.webpackConfig({
    plugins: [
        new ReplaceInFileWebpackPlugin([
            {
                // rewrite font paths
                dir: path.resolve('public/plugins/global'),
                test: /\.css$/,
                rules: [
                    {
                        // // fontawesome
                        // search: /url\((\.\.\/)?webfonts\/(fa-.*?)"?\)/g,
                        // replace: 'url(./fonts/@fortawesome/$2)',
                    },
                    // {
                    //     // flaticon
                    //     search: /url\(("?\.\/)?font\/(Flaticon\..*?)"?\)/g,
                    //     replace: 'url(./fonts/flaticon/$2)',
                    // },
                    // {
                    //     // flaticon2
                    //     search: /url\(("?\.\/)?font\/(Flaticon2\..*?)"?\)/g,
                    //     replace: 'url(./fonts/flaticon2/$2)',
                    // },
                    {
                        // keenthemes fonts
                        search: /url\(("?\.\/)?(Ki\..*?)"?\)/g,
                        replace: 'url(./fonts/keenthemes-icons/$2)',
                    },
                    // {
                    //     // lineawesome fonts
                    //     search: /url\(("?\.\.\/)?fonts\/(la-.*?)"?\)/g,
                    //     replace: 'url(./fonts/line-awesome/$2)',
                    // },
                    // {
                    //     // socicons
                    //     search: /url\(("?\.\.\/)?font\/(socicon\..*?)"?\)/g,
                    //     replace: 'url(./fonts/socicon/$2)',
                    // },
                ],
            },
        ]),
    ],
});

// Webpack.mix does not copy fonts, manually copy
// (glob.sync('resources/metronic/plugins/**/*.+(woff|woff2|eot|ttf)') || []).forEach(file => {
//     var folder = file.match(/resources\/metronic\/plugins\/(.*?)\//)[1];
//     mix.copy(file, `public/plugins/global/fonts/${folder}/${path.basename(file)}`);
// });
// (glob.sync('node_modules/+(@fortawesome|socicon|line-awesome)/**/*.+(woff|woff2|eot|ttf)') || []).forEach(file => {
//     var folder = file.match(/node_modules\/(.*?)\//)[1];
//     mix.copy(file, `public/plugins/global/fonts/${folder}/${path.basename(file)}`);
// });
