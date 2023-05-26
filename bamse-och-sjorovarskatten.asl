state("Bamse")
{
    uint scene : 0x0062EC34;
    bool load : 0x0062EC70, 0x38;
    bool load1 : 0x0062EC70, 0x8, 0x38;
}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
}

init
{
    string MD5 = "";

    try {
    MD5 = (string)vars.Helper.GetMD5Hash();
    } catch {
    MessageBox.Show(
        "The game version could not be identified!\n"
      + "Please restart the game and try again.\n",
         "LiveSplit | Bamse",
        MessageBoxButtons.OK,MessageBoxIcon.Error);
    }

    if (MD5 != "") {
        switch (MD5) {
            case "F09695E691AB306DB0AE97B06B38D133":
                break;
            default:
                MessageBox.Show(
                "This game version was not recognized.\n"
              + "The Auto Splitter may not work as intended!\n"
              + "Please use a supported version if possible.",
                "LiveSplit | Bamse",
                MessageBoxButtons.OK,MessageBoxIcon.Information);
            break;
        }
    }
    refreshRate = 120;
}

start
{
    return old.scene != 108 && current.scene == 108;
}

split
{
    return old.scene != 35 && current.scene == 35;
}

isLoading
{
    return current.load;
}