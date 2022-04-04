#include <SunEngine.h>



class ExampleLayer :public SE::Layer
{
public:
    ExampleLayer():Layer("Example"){}
    void OnUpdate()override
    {
        if (SE::Input::IsKeyPressed(SE::Key::LeftShift))
        {
            SE_INFO("������A��");
        }
    }

    void OnEvent(SE::Event& event)override
    {

    }
};

class Sandbox:public SE::Application
{
public:
    Sandbox() {
        
        
    }

    ~Sandbox() {

    }

};

SE::Application* SE::CreateApplication()
{
    return new Sandbox;
}