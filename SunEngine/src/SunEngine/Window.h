#pragma once

#include "sepch.h"
#include "SunEngine/Core.h"
#include "SunEngine/Events/Event.h"

namespace SE
{
	struct WindowProps
	{
		std::string Title;//窗口名
		unsigned int Width;//窗口宽
		unsigned int Height;//窗口高
		WindowProps(const std::string& title = "Sun Engine", unsigned int width = 1280, unsigned int height = 720) :
			Title(title),
			Width(width),
			Height(height)
		{}

	};


	class SE_API Window
	{
	public:
		
		using EventCallbackFn = std::function<void(Event&)>;
		
		virtual ~Window() {}

		virtual void OnUpdate() = 0;//每帧调用
		virtual unsigned int GetWidth()const = 0;
		virtual unsigned int GetHeight()const = 0;

		virtual void SetEventCallback(const EventCallbackFn& callback) = 0;
		virtual void SetVSync(bool enabled) = 0;
		virtual bool IsVsync()const = 0;
		virtual void* GetNativeWindow()const = 0;

		static Window* Create(const WindowProps& props = WindowProps());
	};
}
