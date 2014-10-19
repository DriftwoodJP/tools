#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

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
          dest: '/Volumes/LaCieHD1TB/Archives/'
          dryRun: true
      archive:
        options:
          src:  '~/Documents/Archives/'
          dest: '/Volumes/LaCieHD1TB/Archives/'
      musicDryrun:
        options:
          src:  '~/Music/'
          dest: '/Volumes/LaCieHD1TB/Music/'
          dryRun: true
      music:
        options:
          src:  '~/Music/'
          dest: '/Volumes/LaCieHD1TB/Music/'
      dropboxDryrun:
        options:
          src:  '~/Dropbox/'
          dest: '/Volumes/LaCieHD1TB/Dropbox/'
          dryRun: true
      dropbox:
        options:
          src:  '~/Dropbox/'
          dest: '/Volumes/LaCieHD1TB/Dropbox/'

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
