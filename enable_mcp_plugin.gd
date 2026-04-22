extends EditorScript

func _run():
    print("Enabling MCP plugin...")
    EditorInterface.set_plugin_enabled("mcp_server", true)
    print("MCP plugin enabled!")
