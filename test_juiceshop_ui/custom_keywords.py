import subprocess
import winreg

def is_product_installed(application_name):
    """
    Check if the product is installed by looking up in the registry.
    """
    paths = [
        r"SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall",
        r"SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
    ]
    for path in paths:
        try:
            with winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, path) as key:
                for i in range(0, winreg.QueryInfoKey(key)[0]):
                    subkey_name = winreg.EnumKey(key, i)
                    with winreg.OpenKey(key, subkey_name) as subkey:
                        try:
                            display_name = winreg.QueryValueEx(subkey, "DisplayName")[0]
                            if application_name.lower() in display_name.lower():
                                uninstall_string = winreg.QueryValueEx(subkey, "UninstallString")[0]
                                return uninstall_string
                        except FileNotFoundError:
                            continue
        except FileNotFoundError:
            continue
    return None


def uninstall_application(application_name):
    """
    Uninstall the application using its uninstall string.
    """
    uninstall_string = is_product_installed(application_name)
    if uninstall_string:
        try:
            # Try to add silent/unattended flags if available
            if "/S" not in uninstall_string and "/quiet" not in uninstall_string and "/silent" not in uninstall_string:
                if uninstall_string.lower().endswith(".exe"):
                    uninstall_string = f'"{uninstall_string}" /S'
            
            print(f"Product '{application_name}' is installed. Proceeding with uninstallation...")
            subprocess.run(uninstall_string, check=True, capture_output=True, text=True)
            print(f"Successfully uninstalled '{application_name}'.")
        except subprocess.CalledProcessError as e:
            print(f"Uninstallation of '{application_name}' failed: {e.stderr}")
    else:
        print(f"Product '{application_name}' is not installed. Skipping uninstallation.")


# Example usage
if __name__ == "__main__":
    application_name = "Your Application Name"  # Replace with the exact application name
    uninstall_application(application_name)
