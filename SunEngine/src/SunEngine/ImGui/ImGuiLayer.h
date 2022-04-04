#pragma once

#include "SunEngine/Layer.h"
#include "SunEngine/Events/MouseEvent.h"
#include "SunEngine/Events/KeyEvent.h"
#include "SunEngine/Events/ApplicationEvent.h"
namespace SE
{
	class SE_API ImGuiLayer:public Layer
	{
	public:
		ImGuiLayer();
		~ImGuiLayer();
		
		virtual void OnAttach()override;
		virtual void OnDetach()override;
		virtual void OnImGuiRender()override;
		void Begin();
		void End();
	private:

		float m_Time = 0.0f;
	};

}
