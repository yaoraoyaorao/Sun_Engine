#include <SunEngine.h>

#include "ImGui/imgui.h"
class ExampleLayer :public SE::Layer
{
public:
    ExampleLayer():Layer("Example"){}
    void OnUpdate()override
    {
        if (SE::Input::IsKeyPressed(SE::Key::LeftShift))
        {
            SE_INFO("°´ÏÂÁËA¼ü");
        }
    }

    void OnEvent(SE::Event& event)override
    {
        
    }
    void OnImGuiRender()override
    {
        ImGui::Begin("Hello Imgui");
        ImGui::Text("Hello Imgui");
        ImGui::End();
    }
};

class Sandbox:public SE::Application
{
public:
    Sandbox() {
        
        PushLayer(new ExampleLayer());
    }

    ~Sandbox() {

    }

};

SE::Application* SE::CreateApplication()
{
    return new Sandbox;
}