#include <SunEngine.h>

class ExampleLayer :public SE::Layer
{
public:
    ExampleLayer():Layer("Example"){}
    void OnUpdate()override
    {
        //SE_INFO("ExampleLyaer:Update");
    }

    void OnEvent(SE::Event& event)override
    {
        SE_TRACE("{0}", event.ToString());
    }
};

class Sandbox:public SE::Application
{
public:
    Sandbox() {
        PushLayer(new SE::ImGuiLayer());
        
    }

    ~Sandbox() {

    }

};

SE::Application* SE::CreateApplication()
{
    return new Sandbox;
}