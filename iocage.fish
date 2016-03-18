# Fish completions for iocage

function __fish_iocage_using_command
  set cmd (commandline -opc)
  if [ (count $cmd) -gt 1 ]
    if [ $argv[1] = $cmd[2] ]
      return 0
    end
  end
  return 1
end

function __fish_iocage_needs_command
	set cmd (commandline -opc)
	if [ (count $cmd) -eq 1 -a $cmd[1] = 'iocage' ]
		return 0
	end
	return 1
end

function __fish_iocage_needs_parameter
  set cmd (commandline -opc)
  if [ (count $cmd) -eq 3 -a $cmd[1] = 'iocage' ]
    return 0
  end
  return 1
end

function __fish_iocage_list_zpools
  command zpool list -o name -H
end

function __fish_iocage_list_jails
  command iocage list | awk '{print $5}' | sed '1d'
end

function __fish_iocage_list_jails_uuid
  command iocage list | awk '{print $2}' | sed '1d'
end
function __fish_iocage_list_parameters_
	echo interfaces=
	echo vnet=
	echo host_hostname=
	echo hostname=
	echo ip4_addr=
	echo ip4_autostart=
	echo ip4_autoend=
	echo ip4_autosubnet=
	echo ip4_saddrsel=
	echo ip4=
	echo ip6_addr=
	echo ip6_saddrsel=
	echo ip6=
	echo defaultrouter=
	echo defaultrouter6=
	echo resolver=
	echo exec_fib=
	echo vnet0_mac=
	echo vnet1_mac=
	echo vnet2_mac=
	echo vnet3_mac=
	echo devfs_ruleset=
	echo mount_devfs=
	echo exec_start=
	echo exec_stop=
	echo exec_prestart=
	echo exec_prestop=
	echo exec_poststop=
	echo exec_poststart=
	echo exec_clean=
	echo exec_timeout=
	echo stop_timeout=
	echo exec_jail_user=
	echo exec_system_jail_user=
	echo exec_system_user=
	echo mount_fdescfs=
	echo mount_procfs=
	echo enforce_statfs=
	echo children_max=
	echo login_flags=
	echo securelevel=
	echo allow_set_hostname=
	echo allow_sysvipc=
	echo allow_raw_sockets=
	echo allow_chflags=
	echo allow_mount=
	echo allow_mount_devfs=
	echo allow_mount_nullfs=
	echo allow_mount_procfs=
	echo allow_mount_tmpfs=
	echo allow_mount_zfs=
	echo allow_quotas=
	echo allow_socket_af=
	echo host_hostuuid=
	echo memoryuse=
	echo memorylocked=
	echo vmemoryuse=
	echo maxproc=
	echo cputime=
	echo pcpu=
	echo datasize=
	echo stacksize=
	echo coredumpsize=
	echo openfiles=
	echo pseudoterminals=
	echo swapuse=
	echo nthr=
	echo msgqqueued=
	echo msgqsize=
	echo nmsgq=
	echo nsemop=
	echo nshm=
	echo shmsize=
	echo wallclock=
	echo tag=
	echo template=
	echo rlimits=
	echo boot=
	echo notes=
	echo owner=
	echo priority=
	echo last_started=
	echo type=
	echo hostid=
	echo cpuset=
	echo jail_zfs=
	echo jail_zfs_dataset=
	echo release=
	echo hack88=
	echo sync_stat=
	echo sync_target=
	echo sync_tgt_zpool=
	echo ftphost=
	echo ftpdir=
	echo gitlocation=
	echo branch=
end

# This NEEDS to be fixed.
function __fish_iocage_list_parameters
  set cmd (commandline -opc)
  if [ $cmd[1] -eq 'set' ]
    if [ (count $cmd) -eq 2 ]
     __fish_iocage_list_parameters_
    end
  else
    __fish_iocage_list_parameters_
  end
end


# General options
complete -f -c iocage -n 'not __fish_iocage_needs_command'
complete -f -c iocage -n '__fish_iocage_needs_command' -a activate -d 'Install iocage to this ZPOOL'
complete -f -c iocage -n '__fish_iocage_using_command activate' -a '(__fish_iocage_list_zpools)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a cap -d 'Reapply resource limits on jail while it is running'
complete -f -c iocage -n '__fish_iocage_using_command cap' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a chroot -d 'Chroot into jail, without actually starting the jail itself.'
complete -f -c iocage -n '__fish_iocage_using_command chroot' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a clean -d 'This removes the ZFS datasets associated with the flag called.'
complete -f -c iocage -n '__fish_iocage_using_command clean' -s a -d 'Destroy everything associated with iocage'
complete -f -c iocage -n '__fish_iocage_using_command clean' -s r -d 'Destroy all releases that have been fetched'
complete -f -c iocage -n '__fish_iocage_using_command clean' -s j -d 'Destroy all jail datasets'

complete -f -c iocage -n '__fish_iocage_needs_command' -a console -d 'Execute login to have a shell inside the jail'
complete -f -c iocage -n '__fish_iocage_using_command console' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a deactivate -d 'Remove the comment that iocage uses to locate a usable pool'
complete -f -c iocage -n '__fish_iocage_using_command deactivate' -a '(__fish_iocage_list_zpools)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a destroy  -d 'Destroy given jail'
complete -f -c iocage -n '__fish_iocage_using_command destroy' -a '(__fish_iocage_list_jails)'
complete -f -c iocage -n '__fish_iocage_using_command destroy' -s f -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a df  -d 'List disk space related information'


complete -f -c iocage -n '__fish_iocage_needs_command' -a exec -d 'Execute command inside the jail'
complete -f -c iocage -n '__fish_iocage_using_command exec' -a '(__fish_iocage_list_jails)'
complete -f -c iocage -n '__fish_iocage_using_command exec' -s u -a '(__fish_iocage_list_jails)' -d 'Username'

complete -f -c iocage -n '__fish_iocage_needs_command' -a export -d 'Export a complete jail'
complete -f -c iocage -n '__fish_iocage_using_command export' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a fetch -d 'Used for downloading and updating/patching releases'

complete -f -c iocage -n '__fish_iocage_needs_command' -a get -d 'Get named property or if "all" keyword is specified dump all properties'
complete -f -c iocage -n '__fish_iocage_using_command get' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a help -d 'Display help'

complete -f -c iocage -n '__fish_iocage_needs_command' -a import -d 'Import full jail images or differential packages'

complete -f -c iocage -n '__fish_iocage_needs_command' -a init-host -d 'Initialize a remote host for iocage'
complete -f -c iocage -n '__fish_iocage_using_command init-host' -a '(__fish_iocage_list_zpools)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a inuse -d 'Display active resource limits for a jail or all jails'
complete -f -c iocage -n '__fish_iocage_using_command inuse' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a limits -d 'Display active resource limits for a jail or all jails'
complete -f -c iocage -n '__fish_iocage_using_command limits' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a list -d 'List jails'
complete -f -c iocage -n '__fish_iocage_using_command list' -s t -d 'List templates'
complete -f -c iocage -n '__fish_iocage_using_command list' -s r -s 'List releases'

complete -f -c iocage -n '__fish_iocage_needs_command' -a package -d 'Package recorded jail session into /iocage/packages'
complete -f -c iocage -n '__fish_iocage_using_command package' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a promote -d 'Promote a cloned jail to a fully independent copy'
complete -f -c iocage -n '__fish_iocage_using_command promote' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a rcboot -d 'Start all jails with boot property set to on'

complete -f -c iocage -n '__fish_iocage_needs_command' -a rcshutdown -d 'Stop all jails with boot property set to on'


complete -f -c iocage -n '__fish_iocage_needs_command' -a record -d 'The record function will record every changed file'
complete -f -c iocage -n '__fish_iocage_using_command record' -a start -a '(__fish_iocage_list_jails)'
complete -f -c iocage -n '__fish_iocage_using_command record' -a stop -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a reset -d 'This will reset a jails properties back to the defaults.'
complete -f -c iocage -n '__fish_iocage_using_command reset' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a restart -d 'Soft restart jail.'
complete -f -c iocage -n '__fish_iocage_using_command restart' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a rollback -d 'Rollback to an existing snapshot'
complete -f -c iocage -n '__fish_iocage_using_command rollback' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a runtime -d 'Show runtime configuration of a jail'
complete -f -c iocage -n '__fish_iocage_using_command runtime' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a set -d 'Set a property to value'
complete -f -c iocage -n '__fish_iocage_using_command set' -a '(__fish_iocage_list_parameters)'
complete -f -c iocage -n '__fish_iocage_needs_parameter set' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a show -d 'Shows the given property for all jails and templates'
complete -f -c iocage -n '__fish_iocage_using_command show' -a '(__fish_iocage_list_parameters_)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a snaplist -d 'List all snapshots belonging to jail'
complete -f -c iocage -n '__fish_iocage_using_command snaplist' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a snapremove -d 'Destroy specified jail snapshot'
complete -f -c iocage -n '__fish_iocage_using_command snapremove' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a snapshot -d 'Create a ZFS snapshot for jail'
complete -f -c iocage -n '__fish_iocage_using_command snapshot' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a start -d 'Start jail'
complete -f -c iocage -n '__fish_iocage_using_command start' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a stop -d 'Stop jail'
complete -f -c iocage -n '__fish_iocage_using_command stop' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a uncap -d 'Release all resource limits, disable limits on the fly'
complete -f -c iocage -n '__fish_iocage_using_command uncap' -a '(__fish_iocage_list_jails)'


complete -f -c iocage -n '__fish_iocage_needs_command' -a update -d 'Update jail to latest patch level'
complete -f -c iocage -n '__fish_iocage_using_command update' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a upgrade -d 'By default this will upgrade jail RELEASE'
complete -f -c iocage -n '__fish_iocage_using_command upgrade' -a '(__fish_iocage_list_jails)'

complete -f -c iocage -n '__fish_iocage_needs_command' -a version -d 'Display iocage version'

complete -f -c iocage -n '__fish_iocage_needs_command' -a create -d 'Deploy a new jail'
complete -f -c iocage -n '__fish_iocage_using_command create' -s b -d 'Create base jail'
complete -f -c iocage -n '__fish_iocage_using_command create' -s e -d 'Create empty jail'
complete -f -c iocage -n '__fish_iocage_using_command create' -s c -d 'Clone from current host RELEASE'
complete -f -c iocage -n '__fish_iocage_using_command create' -a release -d 'Release to use'
complete -f -c iocage -n '__fish_iocage_using_command create' -a pkglist
complete -f -c iocage -n '__fish_iocage_using_command create' -a '(__fish_iocage_list_parameters)'
