#include "ebpch.h"
#include "Application.h"

#include "Ember/Events/ApplicationEvent.h"
#include "Ember/Log.h"

namespace Ember {

	Application::Application()
	{

	}

	Application::~Application()
	{

	}

	void Application::Run()
	{
		WindowResizeEvent e(1280, 720);
		if (e.IsInCategory(EventCategoryApplication))
		{
			EB_TRACE(e);
		}
		if (e.IsInCategory(EventCategoryInput))
		{
			EB_TRACE(e);
		}
		

		while (true);
	}
}