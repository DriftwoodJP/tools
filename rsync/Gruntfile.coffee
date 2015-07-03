#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    dir:
      home:        '~'
      volume_src:  '/Volumes/WDHD'
      volume_dest: '/Volumes/LaCieHD1TB'

    # Task configuration.
    rsync:
      options:
        compareMode: 'sizeOnly'
        recursive: true
        exclude: ['.DS_Store']
        delete: true
      archiveDryrun:
        options:
          src:  '<%= dir.volume_src  %>/Archives/'
          dest: '<%= dir.volume_dest %>/Archives/'
          dryRun: true
      archive:
        options:
          src:  '<%= dir.volume_src  %>/Archives/'
          dest: '<%= dir.volume_dest %>/Archives/'
      musicDryrun:
        options:
          src:  '"<%= dir.volume_src  %>/iTunes Media/"'
          dest: '"<%= dir.volume_dest %>/iTunes Media/"'
          dryRun: true
      music:
        options:
          src:  '"<%= dir.volume_src  %>/iTunes Media/"'
          dest: '"<%= dir.volume_dest %>/iTunes Media/"'
      dropboxDryrun:
        options:
          src:  '<%= dir.home        %>/Dropbox/'
          dest: '<%= dir.volume_dest %>/Dropbox/'
          dryRun: true
      dropbox:
        options:
          src:  '<%= dir.home        %>/Dropbox/'
          dest: '<%= dir.volume_dest %>/Dropbox/'

    shell:
      options:
        stderr: false
      diff:
        command: 'zsh diff-filename.sh'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-rsync"
  grunt.loadNpmTasks "grunt-shell"


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
