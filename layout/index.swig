{% extends '_layout.swig' %}
{% import '_macro/post.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %} {{ config.title }} {% endblock %}

{% block page_class %}
  {% if is_home() %} page-home {% endif %}
{% endblock %}

{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}
      <div class="index-title-row">
        <h1 class="index-post-title" itemprop="name headline">
          <a class="post-title-link" href="{{ url_for(post.path) }}" itemprop="url">
            {{ post.title | default(__('post.untitled'))}}
          </a>
        </h1>
        <time title="{{ __('post.created') }}" itemprop="dateCreated datePublished" datetime="{{ moment(post.date).format() }}">
          {{ date(post.date, config.date_format) }}
        </time>
      </div>
    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
