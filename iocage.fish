
function __fish_iocage_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
end

function __fish_iocage_needs_command
	set cmd (commandline -opc)
	if [ (count $cmd) -eq 1 -a $cmd[1] = 'iocage' ]
		return 0
	end
	return 1
end


function __fish_iocage_list_jails
  command iocage list | awk '{print $5}' | sed '1d'
end

function __fish_iocage_list_jails_uuid
  command iocage list | awk '{print $2}' | sed '1d'
end

# General options
complete -f -c iocage -n 'not __fish_iocage_needs_command'
complete -f -c iocage -n '__fish_iocage_needs_command' -a activate -d 'Install iocage to this ZPOOL'

complete -f -c iocage -n '__fish_iocage_needs_command' -a cap -d 'Reapply resource limits on jail while it is running'
complete -f -c iocage -n '__fish_git_using_command cap' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a chroot -d 'Chroot into jail, without actually starting the jail itself.'
complete -f -c iocage -n '__fish_git_using_command chroot' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a clean -d 'This removes the ZFS datasets associated with the flag called.'
complete -f -c iocage -n '__fish_git_using_command clean' -s a -d 'Destroy everything associated with iocage'
complete -f -c iocage -n '__fish_git_using_command clean' -s r -d 'Destroy all releases that have been fetched'
complete -f -c iocage -n '__fish_git_using_command clean' -s j -d 'Destroy all jail datasets'

complete -f -c iocage -n '__fish_iocage_needs_command' -a console -d 'Execute login to have a shell inside the jail'
complete -f -c iocage -n '__fish_git_using_command console' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a destroy  -d 'Destroy given jail'
complete -f -c iocage -n '__fish_git_using_command destroy' -a '(__fish_iocage_list_jails)'
complete -f -c iocage -n '__fish_git_using_command destroy' -s f -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a df  -d 'List disk space related information'


complete -f -c iocage -n '__fish_iocage_needs_command' -a exec -d 'Execute command inside the jail'
complete -f -c iocage -n '__fish_git_using_command exec' -a '(__fish_iocage_list_jails)'
complete -f -c iocage -n '__fish_git_using_command exec' -s u -a '(__fish_iocage_list_jails)' -d 'Username'

complete -f -c iocage -n '__fish_iocage_needs_command' -a export -d 'Export a complete jail'
complete -f -c iocage -n '__fish_git_using_command export' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a fetch -d 'Used for downloading and updating/patching releases'

complete -f -c iocage -n '__fish_iocage_needs_command' -a get -d 'Get named property or if "all" keyword is specified dump all properties'
complete -f -c iocage -n '__fish_git_using_command get' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a help -d 'Display help'

complete -f -c iocage -n '__fish_iocage_needs_command' -a import -d 'Import full jail images or differential packages'

# TODO fix options
complete -f -c iocage -n '__fish_iocage_needs_command' -a init-host -d 'Initialize a remote host for iocage'

complete -f -c iocage -n '__fish_iocage_needs_command' -a inuse -d 'Display active resource limits for a jail or all jails'
complete -f -c iocage -n '__fish_git_using_command inuse' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a limits -d 'Display active resource limits for a jail or all jails'
complete -f -c iocage -n '__fish_git_using_command limits' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a list -d 'List jails'
complete -f -c iocage -n '__fish_git_using_command list' -s t -d 'List templates'
complete -f -c iocage -n '__fish_git_using_command list' -s r -s 'List releases'


complete -f -c iocage -n '__fish_iocage_needs_command' -a package -d 'Package recorded jail session into /iocage/packages'
complete -f -c iocage -n '__fish_git_using_command package' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a promote -d 'Promote a cloned jail to a fully independent copy'
complete -f -c iocage -n '__fish_git_using_command promote' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a rcboot -d 'Start all jails with boot property set to on'

complete -f -c iocage -n '__fish_iocage_needs_command' -a rcshutdown -d 'Stop all jails with boot property set to on'


complete -f -c iocage -n '__fish_iocage_needs_command' -a record -d 'The record function will record every changed file'
complete -f -c iocage -n '__fish_git_using_command record' -a start -a '(__fish_iocage_list_jails)'
complete -f -c iocage -n '__fish_git_using_command record' -a stop -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a reset -d 'This will reset a jails properties back to the defaults.'
complete -f -c iocage -n '__fish_git_using_command reset' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a restart -d 'Soft restart jail.'
complete -f -c iocage -n '__fish_git_using_command restart' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a rollback -d 'Rollback to an existing snapshot'
complete -f -c iocage -n '__fish_git_using_command rollback' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a runtime -d 'Show runtime configuration of a jail'
complete -f -c iocage -n '__fish_git_using_command runtime' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a set -d 'Set a property to value'
complete -f -c iocage -n '__fish_git_using_command set' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a show -d 'Shows the given property for all jails and templates'
complete -f -c iocage -n '__fish_git_using_command show' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a snaplist -d 'List all snapshots belonging to jail'
complete -f -c iocage -n '__fish_git_using_command snaplist' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a snapremove -d 'Destroy specified jail snapshot'
complete -f -c iocage -n '__fish_git_using_command snapremove' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a snapshot -d 'Create a ZFS snapshot for jail'
complete -f -c iocage -n '__fish_git_using_command snapshot' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a start -d 'Start jail'
complete -f -c iocage -n '__fish_git_using_command start' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a stop -d 'Stop jail'
complete -f -c iocage -n '__fish_git_using_command stop' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a uncap -d 'Release all resource limits, disable limits on the fly'
complete -f -c iocage -n '__fish_git_using_command uncap' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a update -d 'Update jail to latest patch level'
complete -f -c iocage -n '__fish_git_using_command update' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a upgrade -d 'By default this will upgrade jail RELEASE'
complete -f -c iocage -n '__fish_git_using_command upgrade' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a version -d 'Display iocage version'

complete -f -c iocage -n '__fish_iocage_needs_command' -a create -d 'Deploy a new jail'
complete -f -c iocage -n '__fish_git_using_command create' -s b -d 'Create base jail'
complete -f -c iocage -n '__fish_git_using_command create' -s e -d 'Create empty jail'
complete -f -c iocage -n '__fish_git_using_command create' -s c -d 'Clone from current host RELEASE'


