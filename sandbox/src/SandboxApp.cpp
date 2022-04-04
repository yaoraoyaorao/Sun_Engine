#include <SunEngine.h>

#include <glm/vec3.hpp> // glm::vec3
#include <glm/vec4.hpp> // glm::vec4
#include <glm/mat4x4.hpp> // glm::mat4
#include <glm/ext/matrix_transform.hpp> // glm::translate, glm::rotate, glm::scale
#include <glm/ext/matrix_clip_space.hpp> // glm::perspective
#include <glm/ext/scalar_constants.hpp> // glm::pi





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
};

class Sandbox:public SE::Application
{
public:
    Sandbox() {
        PushLayer(new SE::ImGuiLayer());
        PushOverlay(new ExampleLayer());
    }

    ~Sandbox() {

    }

};

SE::Application* SE::CreateApplication()
{
    return new Sandbox;
}