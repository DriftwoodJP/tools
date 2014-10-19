#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    dir:
      volume:    '/Volumes/LaCieHD1TB'

    # Task configuration.
    # pkg: grunt.file.readJSON("package.json")
    rsync:
      options:
        compareMode: 'sizeOnly'
        recursive: true
        exclude: ['.DS_Store']
        delete: true
      archiveDryrun:
        options:
          src:  '~/Documents/Archives/'
          dest: '<%= dir.volume %>/Archives/'
          dryRun: true
      archive:
        options:
          src:  '~/Documents/Archives/'
          dest: '<%= dir.volume %>/Archives/'
      musicDryrun:
        options:
          src:  '~/Music/'
          dest: '<%= dir.volume %>/Music/'
          dryRun: true
      music:
        options:
          src:  '~/Music/'
          dest: '<%= dir.volume %>/Music/'
      dropboxDryrun:
        options:
          src:  '~/Dropbox/'
          dest: '<%= dir.volume %>/Dropbox/'
          dryRun: true
      dropbox:
        options:
          src:  '~/Dropbox/'
          dest: '<%= dir.volume %>/Dropbox/'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-rsync"

  # Default task.
  grunt.registerTask 'default', [
    'rsync:archiveDryrun',
    'rsync:musicDryrun',
    'rsync:dropboxDryrun'
  ]
  grunt.registerTask 'run', [
    'rsync:archive',
    'rsync:music',
    'rsync:dropbox'
  ]
  return
