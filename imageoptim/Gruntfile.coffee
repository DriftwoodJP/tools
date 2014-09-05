#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Task configuration.
    # pkg: grunt.file.readJSON("package.json")
    clean: ['dest']
    copy:
      src2dest:
        expand: true
        cwd: 'src'
        src: '**'
        dest: 'dest'
    imageoptim:
      options:
        jpegMini: false
        imageAlpha: true
        quitAfter: true
      all:
        src: 'dest'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-imageoptim"

  # Default task.
  grunt.registerTask 'default', [
    'clean' ,'copy', 'imageoptim'
  ]
  return
