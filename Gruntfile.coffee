module.exports = (grunt) ->

    grunt.initConfig
        pkg:
            grunt.file.readJSON 'package.json'
        less:
            style:
                files:
                    'build/css/style.css': 'less/style.less'
        coffee:
            main:
                files:
                    'dist/js/main.js': ['coffee/main.coffee']
                options:
                    sourceMap: true
                    sourceMapDir: 'coffee/maps'
        coffeelint:
            main: ['coffee/*.coffee']
            options:
                indentation:
                    value: 4
        watch:
            coffee:
                files: ['coffee/main.coffee']
                tasks: ['coffee-task']
                options:
                    interrupt: yes
            less:
                files: ['less/style.less']
                tasks: ['less-task']
                options:
                    interrupt: yes
            html:
                files: ['html/*.html']
                tasks: ['copy:html']
        copy:
            vendor:
                files: [
                    {
                        expand: true,
                        cwd: 'bower_components/font-awesome/fonts',
                        src: '*.*',
                        dest: 'dist/fonts'
                    }
                ]
            images:
                files: [
                    {
                        expand: true,
                        cwd: 'images',
                        src: '*.*',
                        dest: 'dist/images'
                    }
                ]
            html:
                files: [
                    {
                        expand: true,
                        cwd: 'html',
                        src: '*.html',
                        dest: 'dist'
                    }
                ]
        bower_concat:
            all:
                dest: 'build/js/vendor.js'
                include: [
                    'jquery',
                    'bootstrap',
                    'jquery.popup.overlay',
                    'codemirror',
                    'customize-twitter'
                ]
                mainFiles:
                    "jquery.popup.overlay": ["jquery.popupoverlay.js"]
        uglify:
            options:
                banner: """/**
                    * <%= pkg.name %>
                    * <%= grunt.template.today("yyyy-mm-dd") %>
                    */"""
                mangle: false
                compress:
                    drop_console: true
                beautify: true
            dev:
                options:
                    beautify: true
                    compress: false
                    mangle: false
                    drop_console: false
                    preserveComments: 'all'
            vendor:
                files:
                    'dist/js/vendor.js': ['build/js/vendor.js']
        cssmin:
            target:
                files:
                    'dist/css/style.css': ['build/css/style.css']

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-coffeelint'
    grunt.loadNpmTasks 'grunt-bower-concat'

    grunt.registerTask 'dist', ['bower_concat', 'uglify:vendor', 'copy']
    grunt.registerTask 'coffee-task', ['coffee', 'coffeelint']
    grunt.registerTask 'less-task', ['less', 'cssmin']
    grunt.registerTask 'build', ['coffee-task', 'less-task', 'copy:html']
    grunt.registerTask 'default', ['dist', 'build']
    grunt.registerTask 'dev', ['build', 'watch']
