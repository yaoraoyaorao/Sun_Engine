#pragma once

#ifdef SE_PLATFORM_WINDOWS

extern SE::Application* SE::CreateApplication();

int main(int argc,char ** argv)
{
	SE::Log::Init();
	SE_CORE_INFO("Engine Init");
	SE_INFO("Hello");
	auto app = SE::CreateApplication();
	app->Run();
	
	return 0;
}



#endif