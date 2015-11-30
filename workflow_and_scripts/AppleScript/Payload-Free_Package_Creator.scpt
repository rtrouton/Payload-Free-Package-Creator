on run {input, parameters}
	
	-- this repeat loop prevents empty strings from being submitted for the package name value
	set q to 0
	repeat while q is 0
		set result to text returned of (display dialog "Enter a Name For Your Payload-Free Installer Package:" default answer "Payload-Free Installer Package")
		if result is not "" then
			set pkgname to result
			set q to 1
		end if
	end repeat
	-- this repeat loop prevents empty strings from being submitted for the package identifier value
	set q to 0
	repeat while q is 0
		set result to text returned of (display dialog "Enter a Package Identifier:" default answer "com.github.payload_free")
		if result is not "" then
			set pkgid to result
			set q to 1
		end if
	end repeat
	
	-- this repeat loop prevents empty strings from being submitted for the version identifier value
	set q to 0
	repeat while q is 0
		set result to text returned of (display dialog "Enter a Version Identifier:" default answer "1.0")
		if result is not "" then
			set pkgvers to result
			set q to 1
		end if
	end repeat
	
	-- Set the postinstall script to be executable
	
	do shell script "chmod a+x /tmp/postinstall" with administrator privileges
	
	-- Remove any existing build directories that have the same name as the new payload-free package
	
	do shell script "rm -rf /tmp/" & quoted form of pkgname & "/" with administrator privileges
	
	-- Create the build directories for the payload-free package
	
	do shell script "mkdir /tmp/" & quoted form of pkgname & "" with administrator privileges
	do shell script "mkdir /tmp/" & quoted form of pkgname & "/scripts" with administrator privileges
	do shell script "mkdir /tmp/" & quoted form of pkgname & "/nopayload" with administrator privileges
	
	-- Move the postinstall script into the correct build directory
	
	do shell script "mv /tmp/postinstall /tmp/" & quoted form of pkgname & "/scripts" with administrator privileges
	
	-- Build the payload-free package
	
	do shell script "pkgbuild --identifier " & quoted form of pkgid & " --version " & quoted form of pkgvers & " --root /tmp/" & quoted form of pkgname & "/nopayload --scripts /tmp/" & quoted form of pkgname & "/scripts /tmp/" & quoted form of pkgname & "/" & quoted form of pkgname & ".pkg" with administrator privileges
	
	-- Display dialog that the payload-free package has been created
	
	display alert ((pkgname) as string) & ".pkg has been created."
	
	-- Open a new Finder window that shows the new package
	
	do shell script "open /tmp/" & quoted form of pkgname & ""
	
	return input
end run