#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Task configuration.
    # pkg: grunt.file.readJSON("package.json")
    markdownpdf:
      options:
        cssPath: '../../../../../style/github.css'
      files:
        src: 'src/*.md'
        dest: 'dest/'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-markdown-pdf"

  # Default task.
  grunt.registerTask 'default', [
    'markdownpdf'
  ]
  return
