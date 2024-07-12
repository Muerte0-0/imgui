project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("../../../Binaries/" .. OutputDir .. "/%{prj.name}")
	objdir ("../../../Intermediate/" .. OutputDir .. "/%{prj.name}")

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"

filter "configurations:Debug"
defines { "AE_DEBUG" }
buildoptions "/MDd"
symbols "On"

filter "configurations:Release"
defines { "AE_RELEASE" }
buildoptions "/MD"
optimize "On"

filter "configurations:Dist"
defines { "AE_DIST" }
buildoptions "/MD"
optimize "On"
