project "ImGui"
	kind "StaticLib"
	language "C++"
    	cppdialect "C++20"
    	staticruntime "on"

targetdir (ThirdPartyBinDir)
objdir (ThirdPartyIntDir)

defines
{
	"IMGUI_IMPL_OPENGL_LOADER_GLAD",
    "IMGUI_IMPL_VULKAN_USE_VOLK",
}

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
    "imgui_demo.cpp",
	
	"backends/imgui_impl_glfw.cpp",
	"backends/imgui_impl_opengl3.cpp",
	"backends/imgui_impl_vulkan.cpp",
    "backends/imgui_impl_glfw.h",
	"backends/imgui_impl_opengl3.h",
	"backends/imgui_impl_vulkan.h",
}

includedirs
{
    "../imgui",
	"%{IncludeDir.GLFW}",
	"%{IncludeDir.Volk}",
	"%{IncludeDir.Vulkan}",
}

links
{
	"%{Library.GLFW}",
}

filter "system:windows"
systemversion "latest"

filter "configurations:Debug"
	runtime "Debug"
	symbols "on"

filter "configurations:Release"
	runtime "Release"
	optimize "on"

filter "configurations:Dist"
	runtime "Release"
	optimize "on"
	symbols "off"
