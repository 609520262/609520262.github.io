---
title: Architecture Overview
date: 2023-03-08 20:35:48
---

{% raw %}


 <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap"><nav class="wy-nav-top" aria-label="Mobile navigation menu">
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../contents.html">NVIDIA Cloud Native Technologies</a>
      </nav>

      <div class="wy-nav-content">
        <div class="rst-content">
          <div role="navigation" aria-label="Page navigation">
  <ul class="wy-breadcrumbs">
      <li><a href="../contents.html" class="icon icon-home"></a> »</li>
      <li>Architecture Overview</li>
      <li class="wy-breadcrumbs-aside">
      </li>
  </ul>
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="architecture-overview">
<span id="arch-overview"></span><h1>Architecture Overview<a class="headerlink" href="#architecture-overview" title="Permalink to this heading"></a></h1>
<p>The NVIDIA container stack is architected so that it can be targeted to support any container runtime in the ecosystem.
The components of the stack include:</p>
<ul class="simple">
<li><p>The NVIDIA Container Runtime (<code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code>)</p></li>
<li><p>The NVIDIA Container Runtime Hook (<code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code> / <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime-hook</span></code>)</p></li>
<li><p>The NVIDIA Container Library and CLI (<code class="docutils literal notranslate"><span class="pre">libnvidia-container1</span></code>, <code class="docutils literal notranslate"><span class="pre">nvidia-container-cli</span></code>)</p></li>
</ul>
<p>The components of the NVIDIA container stack are packaged as the NVIDIA Container Toolkit.</p>
<p>How these components are used depends on the container runtime being used. For <code class="docutils literal notranslate"><span class="pre">docker</span></code> or <code class="docutils literal notranslate"><span class="pre">containerd</span></code>, the NVIDIA Container Runtime (<code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code>) is
configured as an OCI-compliant runtime, with the flow through the various components is shown in the following diagram:</p>
<a class="reference internal image-reference" href="../_images/runtime-architecture.png"><img alt="../_images/runtime-architecture.png" src="../_images/runtime-architecture.png" style="width: 800px;"></a>
<p>The flow through components for <code class="docutils literal notranslate"><span class="pre">cri-o</span></code> and <code class="docutils literal notranslate"><span class="pre">lxc</span></code> are shown in the following diagram. It should be noted that in this
case the NVIDIA Container Runtime component is not required.</p>
<a class="reference internal image-reference" href="../_images/nvidia-crio-lxc-arch.png"><img alt="../_images/nvidia-crio-lxc-arch.png" src="../_images/nvidia-crio-lxc-arch.png" style="width: 800px;"></a>
<p>Let’s take a brief look at each of the components in the NVIDIA container stack, starting
with the lowest level component and working up</p>
<section id="components-and-packages">
<h2>Components and Packages<a class="headerlink" href="#components-and-packages" title="Permalink to this heading"></a></h2>
<p>The main packages of the NVIDIA Container Toolkit are:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code></p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">nvidia-cotnainer-toolkit-base</span></code></p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">libnvidia-container-tools</span></code></p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">libnvidia-container1</span></code></p></li>
</ul>
<p>With the dedpendencies between these packages shown below:</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre id="codecell0"><span></span>├─<span class="w"> </span>nvidia-container-toolkit<span class="w"> </span><span class="o">(</span>version<span class="o">)</span>
│<span class="w">    </span>├─<span class="w"> </span>libnvidia-container-tools<span class="w"> </span><span class="o">(</span>&gt;<span class="o">=</span><span class="w"> </span>version<span class="o">)</span>
│<span class="w">    </span>└─<span class="w"> </span>nvidia-container-toolkit-base<span class="w"> </span><span class="o">(</span>version<span class="o">)</span>
│
├─<span class="w"> </span>libnvidia-container-tools<span class="w"> </span><span class="o">(</span>version<span class="o">)</span>
│<span class="w">    </span>└─<span class="w"> </span>libnvidia-container1<span class="w"> </span><span class="o">(</span>&gt;<span class="o">=</span><span class="w"> </span>version<span class="o">)</span>
└─<span class="w"> </span>libnvidia-container1<span class="w"> </span><span class="o">(</span>version<span class="o">)</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell0">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>where <code class="docutils literal notranslate"><span class="pre">version</span></code> is used to represent the NVIDIA Container Toolkit version.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>In the past the <code class="docutils literal notranslate"><span class="pre">nvidia-docker2</span></code> and <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code> packages were also discussed as part of the NVIDIA container stack.
These <strong>packages</strong> should be considered deprecated as their functionality has been merged with the <code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code> package.
The packages may still be available to introduce dependencies on <code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code> and ensure that older workflows continue to function.
For more information on these packages see the documentation archive for version older than <code class="docutils literal notranslate"><span class="pre">v1.12.0</span></code>.</p>
</div>
<section id="the-nvidia-container-library-and-cli">
<h3>The NVIDIA Container Library and CLI<a class="headerlink" href="#the-nvidia-container-library-and-cli" title="Permalink to this heading"></a></h3>
<p>These components are packaged as the <code class="docutils literal notranslate"><span class="pre">libnvidia-container-tools</span></code> and <code class="docutils literal notranslate"><span class="pre">libnvidia-container1</span></code> packages, respectively.</p>
<p>These components provide a library and a simple CLI utility to automatically configure GNU/Linux containers leveraging NVIDIA GPUs.
The implementation relies on kernel primitives and is designed to be agnostic of the container runtime.</p>
<p><code class="docutils literal notranslate"><span class="pre">libnvidia-container</span></code> provides a well-defined API and a wrapper CLI (called <code class="docutils literal notranslate"><span class="pre">nvidia-container-cli</span></code>) that different runtimes can invoke to
inject NVIDIA GPU support into their containers.</p>
</section>
<section id="the-nvidia-container-runtime-hook">
<h3>The NVIDIA Container Runtime Hook<a class="headerlink" href="#the-nvidia-container-runtime-hook" title="Permalink to this heading"></a></h3>
<p>This component is included in the <code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code> package.</p>
<p>This component includes an executable that implements the interface required by a <code class="docutils literal notranslate"><span class="pre">runC</span></code> <code class="docutils literal notranslate"><span class="pre">prestart</span></code> hook. This script is invoked by <code class="docutils literal notranslate"><span class="pre">runC</span></code>
after a container has been created, but before it has been started, and is given access to the <code class="docutils literal notranslate"><span class="pre">config.json</span></code> associated with the container
(e.g. this <a class="reference external" href="https://github.com/opencontainers/runtime-spec/blob/master/config.md#configuration-schema-example=">config.json</a> ). It then takes
information contained in the <code class="docutils literal notranslate"><span class="pre">config.json</span></code> and uses it to invoke the <code class="docutils literal notranslate"><span class="pre">nvidia-container-cli</span></code> CLI with an appropriate set of flags. One of the
most important flags being which specific GPU devices should be injected into the container.</p>
</section>
<section id="the-nvidia-container-runtime">
<h3>The NVIDIA Container Runtime<a class="headerlink" href="#the-nvidia-container-runtime" title="Permalink to this heading"></a></h3>
<p>This component is included in the <code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit-base</span></code> package.</p>
<p>This component used to be a complete fork of <code class="docutils literal notranslate"><span class="pre">runC</span></code> with NVIDIA-specific code injected into it. Since 2019, it is a thin wrapper around the native
<code class="docutils literal notranslate"><span class="pre">runC</span></code> installed on the host system. <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code> takes a <code class="docutils literal notranslate"><span class="pre">runC</span></code> spec as input, injects the NVIDIA Container Runtime Hook as
a <code class="docutils literal notranslate"><span class="pre">prestart</span></code> hook into it, and then calls out to the native <code class="docutils literal notranslate"><span class="pre">runC</span></code>, passing it the modified <code class="docutils literal notranslate"><span class="pre">runC</span></code> spec with that hook set.
For versions of the NVIDIA Container Runtime from <code class="docutils literal notranslate"><span class="pre">v1.12.0</span></code>, this runtime also performs additional modifications to the OCI runtime spec to inject
specific devices and mounts not handled by the NVIDIA Container CLI.</p>
<p>It’s important to note that this component is not necessarily specific to docker (but it is specific to <code class="docutils literal notranslate"><span class="pre">runC</span></code>).</p>
</section>
<section id="the-nvidia-container-toolkit-cli">
<h3>The NVIDIA Container Toolkit CLI<a class="headerlink" href="#the-nvidia-container-toolkit-cli" title="Permalink to this heading"></a></h3>
<p>This component is included in the <code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit-base</span></code> package.</p>
<p>This component is a CLI that includes a number of utilities for interacting with the NVIDIA Container Toolkit. This functionality includes configuring
runtimes such as <code class="docutils literal notranslate"><span class="pre">docker</span></code> for use with the NVIDIA Container Toolkit or generating <a class="reference external" href="https://github.com/container-orchestrated-devices/container-device-interface">Container Device Interface (CDI)</a> specifications.</p>
</section>
</section>
<section id="which-package-should-i-use-then">
<h2>Which package should I use then?<a class="headerlink" href="#which-package-should-i-use-then" title="Permalink to this heading"></a></h2>
<p>Installing the <code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code> package is sufficient for all use cases. This
package is continuously being enhanced with additional functionality and tools that simplify working with containers and
NVIDIA devices.</p>
<p>To use Kubernetes with Docker, you need to configure the Docker <code class="docutils literal notranslate"><span class="pre">daemon.json</span></code> to include
a reference to the NVIDIA Container Runtime and set this runtime as the default. The NVIDIA Container Toolkit contains a utility to update this file
as highlighted in the <code class="docutils literal notranslate"><span class="pre">docker</span></code>-specific installation instructions.</p>
<p>See the <a class="reference internal" href="install-guide.html#install-guide"><span class="std std-ref">Installation Guide</span></a> for more information on installing the NVIDIA Container Toolkit on various Linux distributions.</p>
<section id="package-repository">
<h3>Package Repository<a class="headerlink" href="#package-repository" title="Permalink to this heading"></a></h3>
<p>The packages for the various components listed above are available in the <code class="docutils literal notranslate"><span class="pre">gh-pages</span></code> branch of the GitHub repos of these projects. This is particularly
useful for air-gapped deployments that may want to get access to the actual packages (<code class="docutils literal notranslate"><span class="pre">.deb</span></code> and <code class="docutils literal notranslate"><span class="pre">.rpm</span></code>) to support offline installs.</p>
<p>For the different components:</p>
<ol class="arabic simple">
<li><p><code class="docutils literal notranslate"><span class="pre">nvidia-container-toolkit</span></code></p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">https://github.com/NVIDIA/libnvidia-container/tree/gh-pages/</span></code></p></li>
</ul>
</li>
<li><p><code class="docutils literal notranslate"><span class="pre">libnvidia-container</span></code></p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">https://github.com/NVIDIA/libnvidia-container/tree/gh-pages/</span></code></p></li>
</ul>
</li>
</ol>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>As of the release of version <code class="docutils literal notranslate"><span class="pre">1.6.0</span></code> of the NVIDIA Container Toolkit the packages for all components are
published to the <code class="docutils literal notranslate"><span class="pre">libnvidia-container</span></code> <cite>repository &lt;https://nvidia.github.io/libnvidia-container/&gt;</cite> listed above. For older package versions please see the documentation archives.</p>
</div>
<p>Releases of the software are also hosted on <code class="docutils literal notranslate"><span class="pre">experimental</span></code> branch of the repository and are graduated to <code class="docutils literal notranslate"><span class="pre">stable</span></code> after test/validation. To get access to the latest
<code class="docutils literal notranslate"><span class="pre">experimental</span></code> features of the NVIDIA Container Toolkit, you may need to add the <code class="docutils literal notranslate"><span class="pre">experimental</span></code> branch to the <code class="docutils literal notranslate"><span class="pre">apt</span></code> or <code class="docutils literal notranslate"><span class="pre">yum</span></code> repository listing. The installation instructions
include information on how to add these repository listings for the package manager.</p>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="Footer">
        <a href="concepts.html" class="btn btn-neutral float-left" title="Concepts" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> Previous</a>
        <a href="install-guide.html" class="btn btn-neutral float-right" title="Installation Guide" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr>

  

</footer>
        </div>
      </div>
    </section>
    
	
	
	{% endraw %}
