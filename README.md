Payload-Free-Package-Creator
============================

**OS Compatibility:**

The current release of **Payload-Free Package Creator.app** has been tested and verified to run on the following versions of macOS:

**10.15.4**

**10.14.6**

**10.13.6**

**10.12.6**


Not tested:

**10.11.6.x or earlier**

============================

***Using Payload-Free Package Creator.app***

1. As needed, download the **Payload-Free_Package_Creator_Application.zip** file from the **application** directory in this GitHub repo.

2. Once downloaded and unzipped, double-click on the **Payload-Free Package Creator** application.

3. You'll be prompted to select the script that you want to create a payload-free package from.

4. Once you've selected the script, you'll be prompted to name the payload-free package. By default, the name filled in will be **Payload-Free Installer Package**, but this name can be changed as desired.

5. Once you've entered a name for the installer package, you'll be prompted for a package identifier. By default, the name filled in will be **com.github.payload_free**, but this name should be changed to be something unique.

6. Once you’ve entered an identifier for the installer package, you’ll be prompted for a version number. By default, the value filled in will be **1.0**, but this value should be changed to be something unique. 

7. Once the package name, package identifier and package version number have been set, **Payload-Free Package Creator.app** will prompt for an administrator's username and password.

8. Once the admin username and password are provided, **Payload-Free Package Creator.app** will create the payload-free package and prompt you when it's finished.

9. Click OK at the prompt and a new Finder window will open and display the newly-created payload-free package.

10. **Payload-Free Package Creator.app** will automatically exit.



***How Payload-Free Package Creator.app works***


**Payload-Free Package Creator.app** is an Automator application that uses AppleScript, shell scripting and pkgbuild behind the scenes to create payload-free packages. When a script is selected, the following process takes place:

1. The script is copied to **/tmp** and renamed to **postinstall**, to match the name that pkgbuild is expecting for a post-installation script.

2. After the package name and package identifier are chosen, **/tmp** is checked to make sure that there is not an existing directory that is named the same as the chosen name. If a matching directory is found, it is removed.

3. A new directory is created in **/tmp** that matches the chosen name of the package.

4. Next, a **scripts** directory and an empty directory named **nopayload** are created inside of **/tmp/package_name_here**. The **nopayload** directory provides the empty directory for **pkgbuild**'s **--root** option

5. The **postinstall** script is moved to **/tmp/package_name_here/scripts**

6. The payload-free package is built by pkgbuild using the postinstall script stored in **/tmp/package_name_here/scripts**

7. The finished payload-free package is stored in **/tmp/package_name_here** and the user is prompted that the process is finished.

8. Once the user is notified and clicks OK, a new Finder window opens for **/tmp/package_name_here**


Blog posts: [https://derflounder.wordpress.com/category/payload-free-package-creator/](https://derflounder.wordpress.com/category/payload-free-package-creator/)
