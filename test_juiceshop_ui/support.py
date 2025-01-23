from flaui_uninstaller import FlauiUninstaller

def start_uninstaller(uninstall_string):
    flaui = FlauiUninstaller()
    flaui.start_uninstaller(uninstall_string)
    return flaui

def click_uninstall_button(flaui_instance):
    flaui_instance.click_uninstall_button()

def click_finish_button(flaui_instance):
    flaui_instance.click_finish_button()

def close_uninstaller(flaui_instance):
    flaui_instance.close_uninstaller()
