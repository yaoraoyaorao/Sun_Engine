workspace "SunEngine"
	architecture "x86_64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir={}
IncludeDir["GLFW"] = "SunEngine/vendor/GLFW/include"
IncludeDir["Glad"] = "SunEngine/vendor/Glad/include"
IncludeDir["ImGui"] = "SunEngine/vendor/ImGui"

include "SunEngine/vendor/GLFW"
include "SunEngine/vendor/Glad"
include "SunEngine/vendor/ImGui"

project "SunEngine"
	location "SunEngine"
	kind "SharedLib"
	language "c++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")--输出目录
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")--中间临时文件的目录

    pchheader "sepch.h"
    pchsource "SunEngine/src/sepch.cpp"
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}"
	}
	links
	{
		"GLFW",
		"Glad",
		"ImGui",
		"opengl32.lib"
	}
	filter "system:windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SE_PLATFORM_WINDOWS",
			"SE_BUILD_DLL",
			"_WINDLL",
            "_UNICODE",
            "UNICODE",
			"GLFW_INCLUDE_NONE"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/sandbox")
		}

	filter "configurations:Debug"
		defines "SE_DEBUG"
		runtime "Debug"
		buildoptions "/MDd"
		symbols "On"

	filter "configurations:Release"
		defines "SE_RELEASE"
		runtime "Release"
		buildoptions "/MD"
		optimize "On"

	
	filter "configurations:Dist"
		defines "SE_DIST"
		runtime "Release"
		buildoptions "/MD"
		optimize "On"


project "sandbox"
	location "sandbox"
	kind "ConsoleApp"
	language "c++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")--输出目录
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")--中间临时文件的目录
    
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
	}
	includedirs
	{
		"SunEngine/vendor/spdlog/include",
		"SunEngine/src"
	}

	links
	{
		"SunEngine"
	}

	filter "system:windows"
		cppdialect "c++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
			"SE_PLATFORM_WINDOWS",
			 "_UNICODE",
             "UNICODE",
		}

	filter "configurations:Debug"
        defines "SE_DEBUG"
        runtime "Debug"
        buildoptions "/MDd"
        symbols "on"

    filter "configurations:Release"
        defines "SE_RELEASE"
        runtime "Release"
        buildoptions "/MD"
        optimize "on"

    filter "configurations:Dist"
        defines "SE_DIST"
        runtime "Release"
        buildoptions "/MD"
        optimize "on"