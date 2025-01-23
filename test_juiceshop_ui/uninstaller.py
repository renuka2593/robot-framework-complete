import subprocess
import sys
from FlaUI.Core import Application, AutomationElement
from FlaUI.Core.AutomationElements import Button, Window
from FlaUI.UIA3 import UIA3Automation

class FlauiUninstaller:
    def __init__(self):
        self.app = None
        self.automation = None
        self.window = None

    def start_uninstaller(self, uninstall_string):
        """
        Starts the uninstaller using the given uninstall string.
        """
        self.automation = UIA3Automation()
        self.app = subprocess.Popen(uninstall_string, shell=True)
        self.window = self._wait_for_window(self.app.pid)

    def _wait_for_window(self, process_id):
        """
        Wait for the uninstaller window to open.
        """
        window = self.automation.GetDesktop().FindFirstDescendant(
            lambda cf: cf.ByProcessId(process_id)
        ).AsWindow()
        window.WaitUntilClickable()
        return window

    def click_uninstall_button(self):
        """
        Clicks the "Uninstall" button in the uninstaller UI.
        """
        uninstall_button = self.window.FindFirstDescendant(
            lambda cf: cf.ByAutomationId("uninstall_button_id")  # Replace with actual AutomationId
        ).AsButton()
        uninstall_button.Click()

    def click_finish_button(self):
        """
        Clicks the "Finish" button in the uninstaller UI after uninstallation.
        """
        finish_button = self.window.FindFirstDescendant(
            lambda cf: cf.ByAutomationId("finish_button_id")  # Replace with actual AutomationId
        ).AsButton()
        finish_button.Click()

    def close_uninstaller(self):
        """
        Close the uninstaller window.
        """
        if self.window:
            self.window.Close()
            self.app.terminate()
