#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Task configuration.
    # pkg: grunt.file.readJSON("package.json")
    rsync:
      options:
        # compareMode: 'checksum'
        recursive: true
        exclude: ['.DS_Store']
      dryrun:
        options:
          src:  '~/Documents/Archives/'
          dest: '/Volumes/LaCieHD1TB/Archives/'
          # host: 'default'
          delete: true
          dryRun: true

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-rsync"

  # Default task.
  grunt.registerTask 'default', [
    'rsync'
  ]
  return
