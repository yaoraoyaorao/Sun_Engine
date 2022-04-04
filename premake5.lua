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
IncludeDir["glm"] = "SunEngine/vendor/glm"

include "SunEngine/vendor/GLFW"
include "SunEngine/vendor/Glad"
include "SunEngine/vendor/ImGui"



project "SunEngine"
	location "SunEngine"
	kind "SharedLib"
	language "c++"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")--输出目录
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")--中间临时文件的目录

    pchheader "sepch.h"
    pchsource "SunEngine/src/sepch.cpp"
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp",
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl"
	}
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.Glad}",
		"%{IncludeDir.ImGui}",
		"%{IncludeDir.glm}"
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
		symbols "On"

	filter "configurations:Release"
		defines "SE_RELEASE"
		runtime "Release"
		optimize "On"

	
	filter "configurations:Dist"
		defines "SE_DIST"
		runtime "Release"
		optimize "On"


project "sandbox"
	location "sandbox"
	kind "ConsoleApp"
	language "c++"
	staticruntime "off"

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
		"SunEngine/src",
		"%{IncludeDir.glm}",
		"SunEngine/vendor"
	}

	links
	{
		"SunEngine"
	}

	filter "system:windows"
		cppdialect "c++17"
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
        symbols "on"

    filter "configurations:Release"
        defines "SE_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "SE_DIST"
        runtime "Release"
        optimize "on"