---
title: User Guide
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
      <li>User Guide</li>
      <li class="wy-breadcrumbs-aside">
      </li>
  </ul>
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="user-guide">
<span id="id1"></span><h1>User Guide<a class="headerlink" href="#user-guide" title="Permalink to this heading"></a></h1>
<p>The architecture of the NVIDIA Container Toolkit allows for different container engines
in the ecosystem - <a class="reference external" href="https://docs.docker.com/get-started/overview/">Docker</a>, <a class="reference external" href="https://linuxcontainers.org">LXC</a>,
<a class="reference external" href="http://podman.io/">Podman</a> to be supported easily.</p>
<section id="id2">
<span id="id3"></span><h2>Docker<a class="headerlink" href="#id2" title="Permalink to this heading"></a></h2>
<p>The NVIDIA Container Toolkit provides different options for enumerating GPUs and the capabilities that are supported
for CUDA containers. This user guide demonstrates the following features of the NVIDIA Container Toolkit:</p>
<ul class="simple">
<li><p>Registering the NVIDIA runtime as a custom runtime to Docker</p></li>
<li><p>Using environment variables to enable the following:</p>
<ul>
<li><p>Enumerating GPUs and controlling which GPUs are visible to the container</p></li>
<li><p>Controlling which features of the driver are visible to the container using <cite>capabilities</cite></p></li>
<li><p>Controlling the behavior of the runtime using constraints</p></li>
</ul>
</li>
</ul>
<section id="adding-the-nvidia-runtime">
<h3>Adding the NVIDIA Runtime<a class="headerlink" href="#adding-the-nvidia-runtime" title="Permalink to this heading"></a></h3>
<p>To register the <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime, use the method below that is best suited to your environment.
You might need to merge the new argument with your existing configuration. Three options are available:</p>
<section id="systemd-drop-in-file">
<h4>Systemd drop-in file<a class="headerlink" href="#systemd-drop-in-file" title="Permalink to this heading"></a></h4>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell0"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>mkdir<span class="w"> </span>-p<span class="w"> </span>/etc/systemd/system/docker.service.d
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell0">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell1"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>tee<span class="w"> </span>/etc/systemd/system/docker.service.d/override.conf<span class="w"> </span>&lt;&lt;EOF
<span class="go">[Service]</span>
<span class="go">ExecStart=</span>
<span class="go">ExecStart=/usr/bin/dockerd --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime</span>
<span class="go">EOF</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell1">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell2"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>daemon-reload<span class="w"> </span><span class="se">\</span>
<span class="w">  </span><span class="o">&amp;&amp;</span><span class="w"> </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>restart<span class="w"> </span>docker
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell2">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<section id="daemon-configuration-file">
<h4>Daemon configuration file<a class="headerlink" href="#daemon-configuration-file" title="Permalink to this heading"></a></h4>
<p>The <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime can also be registered with Docker using the <code class="docutils literal notranslate"><span class="pre">daemon.json</span></code> configuration file. The NVIDIA Container Toolkit provides a utility to apply this configuration:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell3"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>nvidia-ctk<span class="w"> </span>runtime<span class="w"> </span>configure<span class="w"> </span>--runtime<span class="o">=</span>docker
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell3">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>You can optionally set the <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime as the default runtime by specifying the <code class="docutils literal notranslate"><span class="pre">--set-as-default</span></code> flag:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell4"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>nvidia-ctk<span class="w"> </span>runtime<span class="w"> </span>configure<span class="w"> </span>--runtime<span class="o">=</span>docker<span class="w"> </span>--set-as-default
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell4">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>And a <code class="docutils literal notranslate"><span class="pre">--dry-run</span></code> flag is also available to preview the changes before applying them.</p>
<p>To apply the new configuration, restart the docker daemon:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell5"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>restart<span class="w"> </span>docker
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell5">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<section id="command-line">
<h4>Command Line<a class="headerlink" href="#command-line" title="Permalink to this heading"></a></h4>
<p>Use <code class="docutils literal notranslate"><span class="pre">dockerd</span></code> to add the <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime:</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre id="codecell6"><span></span>$<span class="w"> </span>sudo<span class="w"> </span>dockerd<span class="w"> </span>--add-runtime<span class="o">=</span><span class="nv">nvidia</span><span class="o">=</span>/usr/bin/nvidia-container-runtime<span class="w"> </span><span class="o">[</span>...<span class="o">]</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell6">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
</section>
<section id="environment-variables-oci-spec">
<h3>Environment variables (OCI spec)<a class="headerlink" href="#environment-variables-oci-spec" title="Permalink to this heading"></a></h3>
<p>Users can control the behavior of the NVIDIA container runtime using environment variables - especially for
enumerating the GPUs and the capabilities of the driver.
Each environment variable maps to an command-line argument for <code class="docutils literal notranslate"><span class="pre">nvidia-container-cli</span></code> from <a class="reference external" href="https://github.com/NVIDIA/libnvidia-container">libnvidia-container</a>.
These variables are already set in the NVIDIA provided base <a class="reference external" href="https://ngc.nvidia.com/catalog/containers/nvidia:cuda">CUDA images</a>.</p>
<section id="gpu-enumeration">
<h4>GPU Enumeration<a class="headerlink" href="#gpu-enumeration" title="Permalink to this heading"></a></h4>
<p>GPUs can be specified to the Docker CLI using either the <code class="docutils literal notranslate"><span class="pre">--gpus</span></code> option starting with Docker <code class="docutils literal notranslate"><span class="pre">19.03</span></code> or using the environment variable
<code class="docutils literal notranslate"><span class="pre">NVIDIA_VISIBLE_DEVICES</span></code>. This variable controls which GPUs will be made accessible inside the container.</p>
<p>The possible values of the <code class="docutils literal notranslate"><span class="pre">NVIDIA_VISIBLE_DEVICES</span></code> variable are:</p>
<div class="wy-table-responsive"><table class="colwidths-given docutils align-default">
<colgroup>
<col style="width: 20%">
<col style="width: 80%">
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>Possible values</p></th>
<th class="head"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">0,1,2,</span></code> or <code class="docutils literal notranslate"><span class="pre">GPU-fef8089b</span></code></p></td>
<td><p>a comma-separated list of GPU UUID(s) or index(es).</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">all</span></code></p></td>
<td><p>all GPUs will be accessible, this is the default value in base CUDA container images.</p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">none</span></code></p></td>
<td><p>no GPU will be accessible, but driver capabilities will be enabled.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">void</span></code> or <cite>empty</cite> or <cite>unset</cite></p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code> will have the same behavior as <code class="docutils literal notranslate"><span class="pre">runc</span></code> (i.e. neither GPUs nor capabilities are exposed)</p></td>
</tr>
</tbody>
</table></div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>When using the <code class="docutils literal notranslate"><span class="pre">--gpus</span></code> option to specify the GPUs, the <code class="docutils literal notranslate"><span class="pre">device</span></code> parameter should be used. This is shown in the examples below.
The format of the <code class="docutils literal notranslate"><span class="pre">device</span></code> parameter should be encapsulated within single quotes, followed by double quotes for the devices you
want enumerated to the container. For example: <code class="docutils literal notranslate"><span class="pre">'"device=2,3"'</span></code> will enumerate GPUs 2 and 3 to the container.</p>
<p>When using the NVIDIA_VISIBLE_DEVICES variable, you may need to set <code class="docutils literal notranslate"><span class="pre">--runtime</span></code> to <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> unless already set as default.</p>
</div>
<p>Some examples of the usage are shown below:</p>
<ol class="arabic">
<li><p>Starting a GPU enabled CUDA container; using <code class="docutils literal notranslate"><span class="pre">--gpus</span></code></p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell7"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--rm<span class="w"> </span>--gpus<span class="w"> </span>all<span class="w"> </span>nvidia/cuda<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell7">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Using <code class="docutils literal notranslate"><span class="pre">NVIDIA_VISIBLE_DEVICES</span></code> and specify the nvidia runtime</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell8"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--rm<span class="w"> </span>--runtime<span class="o">=</span>nvidia<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>-e<span class="w"> </span><span class="nv">NVIDIA_VISIBLE_DEVICES</span><span class="o">=</span>all<span class="w"> </span>nvidia/cuda<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell8">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Start a GPU enabled container on two GPUs</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell9"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--rm<span class="w"> </span>--gpus<span class="w"> </span><span class="m">2</span><span class="w"> </span>nvidia/cuda<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell9">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Starting a GPU enabled container on specific GPUs</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell10"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--gpus<span class="w"> </span><span class="s1">'"device=1,2"'</span><span class="w"> </span><span class="se">\</span>
<span class="w">    </span>nvidia/cuda<span class="w"> </span>nvidia-smi<span class="w"> </span>--query-gpu<span class="o">=</span>uuid<span class="w"> </span>--format<span class="o">=</span>csv
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell10">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell11"><span></span><span class="go">uuid</span>
<span class="go">GPU-ad2367dd-a40e-6b86-6fc3-c44a2cc92c7e</span>
<span class="go">GPU-16a23983-e73e-0945-2095-cdeb50696982</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell11">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Alternatively, you can also use <code class="docutils literal notranslate"><span class="pre">NVIDIA_VISIBLE_DEVICES</span></code></p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell12"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--rm<span class="w"> </span>--runtime<span class="o">=</span>nvidia<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>-e<span class="w"> </span><span class="nv">NVIDIA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">1</span>,2<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>nvidia/cuda<span class="w"> </span>nvidia-smi<span class="w"> </span>--query-gpu<span class="o">=</span>uuid<span class="w"> </span>--format<span class="o">=</span>csv
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell12">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell13"><span></span><span class="go">uuid</span>
<span class="go">GPU-ad2367dd-a40e-6b86-6fc3-c44a2cc92c7e</span>
<span class="go">GPU-16a23983-e73e-0945-2095-cdeb50696982</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell13">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Query the GPU UUID using <code class="docutils literal notranslate"><span class="pre">nvidia-smi</span></code> and then specify that to the container</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell14"><span></span><span class="gp">$ </span>nvidia-smi<span class="w"> </span>-i<span class="w"> </span><span class="m">3</span><span class="w"> </span>--query-gpu<span class="o">=</span>uuid<span class="w"> </span>--format<span class="o">=</span>csv
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell14">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell15"><span></span><span class="go">uuid</span>
<span class="go">GPU-18a3e86f-4c0e-cd9f-59c3-55488c4b0c24</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell15">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell16"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--gpus<span class="w"> </span><span class="nv">device</span><span class="o">=</span>GPU-18a3e86f-4c0e-cd9f-59c3-55488c4b0c24<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/cuda<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell16">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
</ol>
</section>
<section id="driver-capabilities">
<h4>Driver Capabilities<a class="headerlink" href="#driver-capabilities" title="Permalink to this heading"></a></h4>
<p>The <code class="docutils literal notranslate"><span class="pre">NVIDIA_DRIVER_CAPABILITIES</span></code> controls which driver libraries/binaries will be mounted inside the container.</p>
<p>The possible values of the <code class="docutils literal notranslate"><span class="pre">NVIDIA_DRIVER_CAPABILITIES</span></code> variable are:</p>
<div class="wy-table-responsive"><table class="colwidths-given docutils align-default">
<colgroup>
<col style="width: 20%">
<col style="width: 80%">
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>Possible values</p></th>
<th class="head"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">compute,video</span></code> or <code class="docutils literal notranslate"><span class="pre">graphics,utility</span></code></p></td>
<td><p>a comma-separated list of driver features the container needs.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">all</span></code></p></td>
<td><p>enable all available driver capabilities.</p></td>
</tr>
<tr class="row-even"><td><p><cite>empty</cite> or <cite>unset</cite></p></td>
<td><p>use default driver capability: <code class="docutils literal notranslate"><span class="pre">utility</span></code>, <code class="docutils literal notranslate"><span class="pre">compute</span></code></p></td>
</tr>
</tbody>
</table></div>
<p>The supported driver capabilities are provided below:</p>
<div class="wy-table-responsive"><table class="colwidths-given docutils align-default">
<colgroup>
<col style="width: 20%">
<col style="width: 80%">
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>Driver Capability</p></th>
<th class="head"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">compute</span></code></p></td>
<td><p>required for CUDA and OpenCL applications.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">compat32</span></code></p></td>
<td><p>required for running 32-bit applications.</p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">graphics</span></code></p></td>
<td><p>required for running OpenGL and Vulkan applications.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">utility</span></code></p></td>
<td><p>required for using <code class="docutils literal notranslate"><span class="pre">nvidia-smi</span></code> and NVML.</p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">video</span></code></p></td>
<td><p>required for using the Video Codec SDK.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">display</span></code></p></td>
<td><p>required for leveraging X11 display.</p></td>
</tr>
</tbody>
</table></div>
<p>For example, specify the <code class="docutils literal notranslate"><span class="pre">compute</span></code> and <code class="docutils literal notranslate"><span class="pre">utility</span></code> capabilities, allowing usage of CUDA and NVML</p>
<blockquote>
<div><div class="highlight-console notranslate"><div class="highlight"><pre id="codecell17"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--rm<span class="w"> </span>--runtime<span class="o">=</span>nvidia<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>-e<span class="w"> </span><span class="nv">NVIDIA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">2</span>,3<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>-e<span class="w"> </span><span class="nv">NVIDIA_DRIVER_CAPABILITIES</span><span class="o">=</span>compute,utility<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>nvidia/cuda<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell17">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell18"><span></span><span class="gp">$ </span>docker<span class="w"> </span>run<span class="w"> </span>--rm<span class="w"> </span>--gpus<span class="w"> </span><span class="s1">'all,"capabilities=compute,utility"'</span><span class="w"> </span><span class="se">\</span>
<span class="w">    </span>nvidia/cuda:11.6.2-base-ubuntu20.04<span class="w"> </span>nvidia-smi
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell18">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</div></blockquote>
</section>
<section id="constraints">
<h4>Constraints<a class="headerlink" href="#constraints" title="Permalink to this heading"></a></h4>
<p>The NVIDIA runtime also provides the ability to define constraints on the configurations supported by the container.</p>
<section id="nvidia-require">
<h5><code class="docutils literal notranslate"><span class="pre">NVIDIA_REQUIRE_*</span></code><a class="headerlink" href="#nvidia-require" title="Permalink to this heading"></a></h5>
<p>This variable is a logical expression to define constraints on the software versions or GPU architectures on the container.</p>
<p>The supported constraints are provided below:</p>
<div class="wy-table-responsive"><table class="colwidths-given docutils align-default">
<colgroup>
<col style="width: 20%">
<col style="width: 80%">
</colgroup>
<thead>
<tr class="row-odd"><th class="head"><p>Constraint</p></th>
<th class="head"><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">cuda</span></code></p></td>
<td><p>constraint on the CUDA driver version.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">driver</span></code></p></td>
<td><p>constraint on the driver version.</p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">arch</span></code></p></td>
<td><p>constraint on the compute architectures of the selected GPUs.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">brand</span></code></p></td>
<td><p>constraint on the brand of the selected GPUs (e.g. GeForce, Tesla, GRID).</p></td>
</tr>
</tbody>
</table></div>
<p>Multiple constraints can be expressed in a single environment variable: space-separated constraints are ORed,
comma-separated constraints are ANDed.
Multiple environment variables of the form <code class="docutils literal notranslate"><span class="pre">NVIDIA_REQUIRE_*</span></code> are ANDed together.</p>
<p>For example, the following constraints can be specified to the container image for constraining the supported CUDA and
driver versions:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell19"><span></span><span class="go">NVIDIA_REQUIRE_CUDA "cuda&gt;=11.0 driver&gt;=450"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell19">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<section id="nvidia-disable-require">
<h5><code class="docutils literal notranslate"><span class="pre">NVIDIA_DISABLE_REQUIRE</span></code><a class="headerlink" href="#nvidia-disable-require" title="Permalink to this heading"></a></h5>
<p>Single switch to disable all the constraints of the form <code class="docutils literal notranslate"><span class="pre">NVIDIA_REQUIRE_*</span></code>.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>If you are running CUDA-base images older than CUDA 11.7 (and unable to update to the new base images with updated constraints),
CUDA compatibility checks can be disabled by setting <code class="docutils literal notranslate"><span class="pre">NVIDIA_DISABLE_REQUIRE</span></code> to <code class="docutils literal notranslate"><span class="pre">true</span></code>.</p>
</div>
</section>
<section id="nvidia-require-cuda">
<h5><code class="docutils literal notranslate"><span class="pre">NVIDIA_REQUIRE_CUDA</span></code><a class="headerlink" href="#nvidia-require-cuda" title="Permalink to this heading"></a></h5>
<p>The version of the CUDA toolkit used by the container. It is an instance of the
generic <code class="docutils literal notranslate"><span class="pre">NVIDIA_REQUIRE_*</span></code> case and it is set by official CUDA images. If the version of the NVIDIA driver
is insufficient to run this version of CUDA, the container will not be started. This variable
can be specified in the form <code class="docutils literal notranslate"><span class="pre">major.minor</span></code></p>
<p>The possible values for this variable: <code class="docutils literal notranslate"><span class="pre">cuda&gt;=7.5</span></code>, <code class="docutils literal notranslate"><span class="pre">cuda&gt;=8.0</span></code>, <code class="docutils literal notranslate"><span class="pre">cuda&gt;=9.0</span></code> and so on.</p>
</section>
</section>
<section id="dockerfiles">
<h4>Dockerfiles<a class="headerlink" href="#dockerfiles" title="Permalink to this heading"></a></h4>
<p>Capabilities and GPU enumeration can be set in images via environment variables. If the environment variables are
set inside the Dockerfile, you don’t need to set them on the <code class="docutils literal notranslate"><span class="pre">docker</span> <span class="pre">run</span></code> command-line.</p>
<p>For instance, if you are creating your own custom CUDA container, you should use the following:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell20"><span></span><span class="go">ENV NVIDIA_VISIBLE_DEVICES all</span>
<span class="go">ENV NVIDIA_DRIVER_CAPABILITIES compute,utility</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell20">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>These environment variables are already set in the NVIDIA provided CUDA images.</p>
</section>
</section>
<section id="troubleshooting">
<h3>Troubleshooting<a class="headerlink" href="#troubleshooting" title="Permalink to this heading"></a></h3>
<section id="generating-debugging-logs">
<h4>Generating debugging logs<a class="headerlink" href="#generating-debugging-logs" title="Permalink to this heading"></a></h4>
<p>For most common issues, debugging logs can be generated and can help us root cause the problem.
In order to generate these:</p>
<ul class="simple">
<li><p>Edit your runtime configuration under <code class="docutils literal notranslate"><span class="pre">/etc/nvidia-container-runtime/config.toml</span></code> and uncomment the <code class="docutils literal notranslate"><span class="pre">debug=...</span></code> line.</p></li>
<li><p>Run your container again, thus reproducing the issue and generating the logs.</p></li>
</ul>
</section>
<section id="generating-core-dumps">
<h4>Generating core dumps<a class="headerlink" href="#generating-core-dumps" title="Permalink to this heading"></a></h4>
<p>In the event of a critical failure, core dumps can be automatically generated and can help us troubleshoot issues.
Refer to <a class="reference external" href="http://man7.org/linux/man-pages/man5/core.5.html">core(5)</a> in order to generate these, in particular make sure that:</p>
<ul class="simple">
<li><p><code class="docutils literal notranslate"><span class="pre">/proc/sys/kernel/core_pattern</span></code> is correctly set and points somewhere with write access</p></li>
<li><p><code class="docutils literal notranslate"><span class="pre">ulimit</span> <span class="pre">-c</span></code> is set to a sensible default</p></li>
</ul>
<p>In case the <code class="docutils literal notranslate"><span class="pre">nvidia-container-cli</span></code> process becomes unresponsive, <a class="reference external" href="http://man7.org/linux/man-pages/man1/gcore.1.html">gcore(1)</a> can also be used.</p>
</section>
<section id="sharing-your-debugging-information">
<h4>Sharing your debugging information<a class="headerlink" href="#sharing-your-debugging-information" title="Permalink to this heading"></a></h4>
<p>You can attach a particular output to your issue with a <a class="reference external" href="https://help.github.com/articles/file-attachments-on-issues-and-pull-requests/">drag and drop</a>
into the comment section.</p>
</section>
</section>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="Footer">
        <a href="troubleshooting.html" class="btn btn-neutral float-left" title="Troubleshooting" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> Previous</a>
        <a href="release-notes.html" class="btn btn-neutral float-right" title="Release Notes" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr>


</footer>
        </div>
      </div>
    </section>
 
    
	
	
	{% endraw %}
