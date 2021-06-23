#pragma once

#ifdef EB_PLATFORM_WINDOWS

extern Ember::Application* Ember::CreateApplication();

int main(int argc, char** argv)
{
	Ember::Log::Init();
	EB_CORE_WARN("Initialized Log!");
	int a = 5;
	EB_INFO("Hello Var={0}", a);

	auto app = Ember::CreateApplication();
	app->Run();
	delete app;
}

#endif