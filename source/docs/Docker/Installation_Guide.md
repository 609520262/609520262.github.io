---
title: Installation Guide
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
      <li>Getting Started</li>
      <li class="wy-breadcrumbs-aside">
      </li>
  </ul>
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
             
  <section id="getting-started">
<span id="operator-install-guide"></span><h1>Getting Started<a class="headerlink" href="#getting-started" title="Permalink to this heading"></a></h1>
<p>This document provides instructions, including pre-requisites for getting started with the NVIDIA GPU Operator.</p>
<hr class="docutils">
<section id="red-hat-openshift-4">
<h2>Red Hat OpenShift 4<a class="headerlink" href="#red-hat-openshift-4" title="Permalink to this heading"></a></h2>
<p>For installing the GPU Operator on clusters with Red Hat OpenShift using RHCOS worker nodes,
follow the <a class="reference internal" href="openshift/introduction.html#openshift-introduction"><span class="std std-ref">user guide</span></a>.</p>
</section>
<hr class="docutils">
<section id="vmware-vsphere-with-tanzu">
<h2>VMware vSphere with Tanzu<a class="headerlink" href="#vmware-vsphere-with-tanzu" title="Permalink to this heading"></a></h2>
<p>For installing the GPU Operator on VMware vSphere with Tanzu leveraging NVIDIA AI Enterprise,
follow the <a class="reference internal" href="install-gpu-operator-nvaie.html#install-gpu-operator-nvaie"><span class="std std-ref">NVIDIA AI Enterprise document</span></a>.</p>
</section>
<hr class="docutils">
<section id="google-cloud-anthos">
<h2>Google Cloud Anthos<a class="headerlink" href="#google-cloud-anthos" title="Permalink to this heading"></a></h2>
<p>For getting started with NVIDIA GPUs for Google Cloud Anthos, follow the getting started
<a class="reference external" href="https://docs.nvidia.com/datacenter/cloud-native/kubernetes/anthos-guide.html">document</a>.</p>
</section>
<hr class="docutils">
<section id="prerequisites">
<h2>Prerequisites<a class="headerlink" href="#prerequisites" title="Permalink to this heading"></a></h2>
<p>Before installing the GPU Operator, you should ensure that the Kubernetes cluster meets some prerequisites.</p>
<ol class="arabic simple">
<li><p>Nodes must be configured with a container engine such as Docker CE/EE, <code class="docutils literal notranslate"><span class="pre">cri-o</span></code>, or <code class="docutils literal notranslate"><span class="pre">containerd</span></code>. For <strong>docker</strong>, follow the official install
<a class="reference external" href="https://docs.docker.com/engine/install/">instructions</a>.</p></li>
<li><p>Node Feature Discovery (NFD) is a dependency for the Operator on each node. By default, NFD master and worker are automatically deployed by the Operator.
If NFD is already running in the cluster prior to the deployment of the operator, then the Operator can be configured to not to install NFD.</p></li>
<li><p>For monitoring in Kubernetes 1.13 and 1.14, enable the kubelet <code class="docutils literal notranslate"><span class="pre">KubeletPodResources</span></code> <a class="reference external" href="https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/">feature</a>
gate. From Kubernetes 1.15 onwards, its enabled by default.</p></li>
</ol>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>To enable the <code class="docutils literal notranslate"><span class="pre">KubeletPodResources</span></code> feature gate, run the following command: <code class="docutils literal notranslate"><span class="pre">echo</span> <span class="pre">-e</span> <span class="pre">"KUBELET_EXTRA_ARGS=--feature-gates=KubeletPodResources=true"</span> <span class="pre">|</span> <span class="pre">sudo</span> <span class="pre">tee</span> <span class="pre">/etc/default/kubelet</span></code></p>
</div>
<p>Before installing the GPU Operator on NVIDIA vGPU, ensure the following.</p>
<ol class="arabic simple">
<li><p>The NVIDIA vGPU Host Driver version 12.0 (or later) is pre-installed on all hypervisors hosting NVIDIA vGPU accelerated Kubernetes worker node virtual machines. Please refer to <a class="reference external" href="https://docs.nvidia.com/grid/12.0/index.html">NVIDIA vGPU Documentation</a> for details.</p></li>
<li><p>A NVIDIA vGPU License Server is installed and reachable from all Kubernetes worker node virtual machines.</p></li>
<li><p>A private registry is available to upload the NVIDIA vGPU specific driver container image.</p></li>
<li><p>Each Kubernetes worker node in the cluster has access to the private registry. Private registry access is usually managed through imagePullSecrets. See the Kubernetes Documentation for more information. The user is required to provide these secrets to the NVIDIA GPU-Operator in the driver section of the values.yaml file.</p></li>
<li><p>Git and Docker/Podman are required to build the vGPU driver image from source repository and push to local registry.</p></li>
</ol>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>Uploading the NVIDIA vGPU driver to a publicly available repository or otherwise publicly sharing the driver is a violation of the NVIDIA vGPU EULA.</p>
</div>
<p>The rest of this document includes instructions for installing the GPU Operator on supported Linux distributions.</p>
</section>
<section id="install-kubernetes">
<h2>Install Kubernetes<a class="headerlink" href="#install-kubernetes" title="Permalink to this heading"></a></h2>
<p>Refer to <a class="reference internal" href="../kubernetes/install-k8s.html#install-k8s"><span class="std std-ref">Install Kubernetes</span></a> for getting started with setting up a Kubernetes cluster.</p>
</section>
<section id="install-nvidia-gpu-operator">
<span id="install-gpu-operator"></span><h2>Install NVIDIA GPU Operator<a class="headerlink" href="#install-nvidia-gpu-operator" title="Permalink to this heading"></a></h2>
<section id="install-helm">
<h3>Install Helm<a class="headerlink" href="#install-helm" title="Permalink to this heading"></a></h3>
<p>The preferred method to deploy the GPU Operator is using <code class="docutils literal notranslate"><span class="pre">helm</span></code>.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell0"><span></span><span class="gp">$ </span>curl<span class="w"> </span>-fsSL<span class="w"> </span>-o<span class="w"> </span>get_helm.sh<span class="w"> </span>https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3<span class="w"> </span><span class="se">\</span>
<span class="w">   </span><span class="o">&amp;&amp;</span><span class="w"> </span>chmod<span class="w"> </span><span class="m">700</span><span class="w"> </span>get_helm.sh<span class="w"> </span><span class="se">\</span>
<span class="w">   </span><span class="o">&amp;&amp;</span><span class="w"> </span>./get_helm.sh
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell0">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Now, add the NVIDIA Helm repository:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell1"><span></span><span class="gp">$ </span>helm<span class="w"> </span>repo<span class="w"> </span>add<span class="w"> </span>nvidia<span class="w"> </span>https://helm.ngc.nvidia.com/nvidia<span class="w"> </span><span class="se">\</span>
<span class="w">   </span><span class="o">&amp;&amp;</span><span class="w"> </span>helm<span class="w"> </span>repo<span class="w"> </span>update
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell1">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<section id="install-the-gpu-operator">
<h3>Install the GPU Operator<a class="headerlink" href="#install-the-gpu-operator" title="Permalink to this heading"></a></h3>
<p>The GPU Operator Helm chart offers a number of customizable options that can be configured depending on your environment.</p>
<div class="align-default"><img height="120" src="../_images/blockdiag-9ab121b0af6e54db8e70aef1d4d49cd964af7cd7.png" width="640"></div>
<section id="chart-customization-options">
<span id="gpu-operator-helm-chart-options"></span><h4>Chart Customization Options<a class="headerlink" href="#chart-customization-options" title="Permalink to this heading"></a></h4>
<p>The following options are available when using the Helm chart. These options can be used with <code class="docutils literal notranslate"><span class="pre">--set</span></code> when installing via Helm.</p>
<div class="wy-table-responsive"><table class="colwidths-auto docutils align-center">
<thead>
<tr class="row-odd"><th class="head"><p>Parameter</p></th>
<th class="head"><p>Description</p></th>
<th class="head"><p>Default</p></th>
</tr>
</thead>
<tbody>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">nfd.enabled</span></code></p></td>
<td><p>Deploys Node Feature Discovery plugin as a daemonset.
Set this variable to <code class="docutils literal notranslate"><span class="pre">false</span></code> if NFD is already running in the cluster.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">true</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">operator.defaultRuntime</span></code></p></td>
<td><p><strong>DEPRECATED as of v1.9</strong></p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">docker</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">mig.strategy</span></code></p></td>
<td><p>Controls the strategy to be used with MIG on supported NVIDIA GPUs. Options
are either <code class="docutils literal notranslate"><span class="pre">mixed</span></code> or <code class="docutils literal notranslate"><span class="pre">single</span></code>.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">single</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">psp.enabled</span></code></p></td>
<td><p>The GPU operator deploys <code class="docutils literal notranslate"><span class="pre">PodSecurityPolicies</span></code> if enabled.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">false</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">driver.enabled</span></code></p></td>
<td><p>By default, the Operator deploys NVIDIA drivers as a container on the system.
Set this value to <code class="docutils literal notranslate"><span class="pre">false</span></code> when using the Operator on systems with pre-installed drivers.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">true</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">driver.repository</span></code></p></td>
<td><p>The images are downloaded from NGC. Specify another image repository when using
custom driver images.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">nvcr.io/nvidia</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">driver.version</span></code></p></td>
<td><p>Version of the NVIDIA datacenter driver supported by the Operator.</p></td>
<td><p>Depends on the version of the Operator. See the Component Matrix
for more information on supported drivers.</p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">driver.rdma.enabled</span></code></p></td>
<td><p>Controls whether the driver daemonset should build and load the <code class="docutils literal notranslate"><span class="pre">nvidia-peermem</span></code> kernel module.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">false</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">driver.rdma.useHostMofed</span></code></p></td>
<td><p>Indicate if MOFED is directly pre-installed on the host. This is used to build and load <code class="docutils literal notranslate"><span class="pre">nvidia-peermem</span></code> kernel module.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">false</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">toolkit.enabled</span></code></p></td>
<td><p>By default, the Operator deploys the NVIDIA Container Toolkit (<code class="docutils literal notranslate"><span class="pre">nvidia-docker2</span></code> stack)
as a container on the system. Set this value to <code class="docutils literal notranslate"><span class="pre">false</span></code> when using the Operator on systems
with pre-installed NVIDIA runtimes.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">true</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">migManager.enabled</span></code></p></td>
<td><p>The MIG manager watches for changes to the MIG geometry and applies reconfiguration as needed. By
default, the MIG manager only runs on nodes with GPUs that support MIG (for e.g. A100).</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">true</span></code></p></td>
</tr>
<tr class="row-odd"><td><p><code class="docutils literal notranslate"><span class="pre">operator.labels</span></code></p></td>
<td><p>Map of custom labels that will be added to all GPU Operator managed pods.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">{}</span></code></p></td>
</tr>
<tr class="row-even"><td><p><code class="docutils literal notranslate"><span class="pre">operator.annotations</span></code></p></td>
<td><p>Map of custom annotations that will be added to all GPU Operator managed pods.</p></td>
<td><p><code class="docutils literal notranslate"><span class="pre">{}</span></code></p></td>
</tr>
</tbody>
</table></div>
</section>
<section id="namespace">
<h4>Namespace<a class="headerlink" href="#namespace" title="Permalink to this heading"></a></h4>
<p>Prior to GPU Operator v1.9, the operator was installed in the <code class="docutils literal notranslate"><span class="pre">default</span></code> namespace while all operands were
installed in the <code class="docutils literal notranslate"><span class="pre">gpu-operator-resources</span></code> namespace.</p>
<p>Starting with GPU Operator v1.9, both the operator and operands get installed in the same namespace.
The namespace is configurable and is determined during installation. For example, to install the GPU Operator
in the <code class="docutils literal notranslate"><span class="pre">gpu-operator</span></code> namespace:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell2"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell2">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>If a namespace is not specified during installation, all GPU Operator components will be installed in the
<code class="docutils literal notranslate"><span class="pre">default</span></code> namespace.</p>
</section>
<section id="operands">
<h4>Operands<a class="headerlink" href="#operands" title="Permalink to this heading"></a></h4>
<p>By default, the GPU Operator operands are deployed on all GPU worker nodes in the cluster.
GPU worker nodes are identified by the presence of the label <code class="docutils literal notranslate"><span class="pre">feature.node.kubernetes.io/pci-10de.present=true</span></code>,
where <code class="docutils literal notranslate"><span class="pre">0x10de</span></code> is the PCI vendor ID assigned to NVIDIA.</p>
<p>To disable operands from getting deployed on a GPU worker node, label the node with <code class="docutils literal notranslate"><span class="pre">nvidia.com/gpu.deploy.operands=false</span></code>.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell3"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>label<span class="w"> </span>nodes<span class="w"> </span><span class="nv">$NODE</span><span class="w"> </span>nvidia.com/gpu.deploy.operands<span class="o">=</span><span class="nb">false</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell3">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<section id="common-deployment-scenarios">
<h4>Common Deployment Scenarios<a class="headerlink" href="#common-deployment-scenarios" title="Permalink to this heading"></a></h4>
<p>In this section, we present some common deployment recipes when using the Helm chart to install the GPU Operator.</p>
<section id="bare-metal-passthrough-with-default-configurations-on-ubuntu">
<h5>Bare-metal/Passthrough with default configurations on Ubuntu<a class="headerlink" href="#bare-metal-passthrough-with-default-configurations-on-ubuntu" title="Permalink to this heading"></a></h5>
<p>In this scenario, the default configuration options are used:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell4"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell4">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<ul class="simple">
<li><p>For installing on Secure Boot systems or using Precompiled modules refer to <a class="reference internal" href="install-precompiled-signed-drivers.html#install-precompiled-signed-drivers"><span class="std std-ref">Installing Precompiled and Canonical Signed Drivers on Ubuntu 20.04 and 22.04</span></a>.</p></li>
</ul>
</div>
</section>
<section id="bare-metal-passthrough-with-default-configurations-on-red-hat-enterprise-linux">
<h5>Bare-metal/Passthrough with default configurations on Red Hat Enterprise Linux<a class="headerlink" href="#bare-metal-passthrough-with-default-configurations-on-red-hat-enterprise-linux" title="Permalink to this heading"></a></h5>
<p>In this scenario, the default configuration options are used:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell5"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell5">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<ul class="simple">
<li><p>When using RHEL8 with Kubernetes, SELinux has to be enabled (either in permissive or enforcing mode) for use with the GPU Operator. Additionally, network restricted environments are not supported.</p></li>
</ul>
</div>
</section>
<section id="bare-metal-passthrough-with-default-configurations-on-centos">
<h5>Bare-metal/Passthrough with default configurations on CentOS<a class="headerlink" href="#bare-metal-passthrough-with-default-configurations-on-centos" title="Permalink to this heading"></a></h5>
<p>In this scenario, the CentOS toolkit image is used:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell6"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>toolkit.version<span class="o">=</span><span class="m">1</span>.7.1-centos7
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell6">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<ul class="simple">
<li><p>For CentOS 8 systems, use <cite>toolkit.version=1.7.1-centos8</cite>.</p></li>
<li><p>Replace <cite>1.7.1</cite> toolkit version used here with the latest one available <a class="reference external" href="https://ngc.nvidia.com/catalog/containers/nvidia:k8s:container-toolkit/tags">here</a>.</p></li>
</ul>
</div>
</section>
<hr class="docutils">
<section id="nvidia-vgpu">
<h5>NVIDIA vGPU<a class="headerlink" href="#nvidia-vgpu" title="Permalink to this heading"></a></h5>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>The GPU Operator with NVIDIA vGPUs requires additional steps to build a private driver image prior to install.
Refer to the document <a class="reference internal" href="install-gpu-operator-vgpu.html#install-gpu-operator-vgpu"><span class="std std-ref">NVIDIA vGPU</span></a> for detailed instructions on the workflow and required values of
the variables used in this command.</p>
</div>
<p>The command below will install the GPU Operator with its default configuration for vGPU:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell7"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.repository<span class="o">=</span><span class="nv">$PRIVATE_REGISTRY</span><span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.version<span class="o">=</span><span class="nv">$VERSION</span><span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.imagePullSecrets<span class="o">={</span><span class="nv">$REGISTRY_SECRET_NAME</span><span class="o">}</span><span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.licensingConfig.configMapName<span class="o">=</span>licensing-config
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell7">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<hr class="docutils">
<section id="nvidia-ai-enterprise">
<h5>NVIDIA AI Enterprise<a class="headerlink" href="#nvidia-ai-enterprise" title="Permalink to this heading"></a></h5>
<p>Refer to <a class="reference internal" href="install-gpu-operator-nvaie.html#install-gpu-operator-nvaie"><span class="std std-ref">GPU Operator with NVIDIA AI Enterprise</span></a>.</p>
</section>
<hr class="docutils">
<section id="bare-metal-passthrough-with-pre-installed-nvidia-drivers">
<h5>Bare-metal/Passthrough with pre-installed NVIDIA drivers<a class="headerlink" href="#bare-metal-passthrough-with-pre-installed-nvidia-drivers" title="Permalink to this heading"></a></h5>
<p>In this example, the user has already pre-installed NVIDIA drivers as part of the system image:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell8"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.enabled<span class="o">=</span><span class="nb">false</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell8">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<hr class="docutils">
</section>
<section id="bare-metal-passthrough-with-pre-installed-drivers-and-nvidia-container-toolkit">
<span id="preinstalled-drivers-and-toolkit"></span><h5>Bare-metal/Passthrough with pre-installed drivers and NVIDIA Container Toolkit<a class="headerlink" href="#bare-metal-passthrough-with-pre-installed-drivers-and-nvidia-container-toolkit" title="Permalink to this heading"></a></h5>
<p>In this example, the user has already pre-installed the NVIDIA drivers and NVIDIA Container Toolkit (<code class="docutils literal notranslate"><span class="pre">nvidia-docker2</span></code>)
as part of the system image.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>These steps should be followed when using the GPU Operator v1.9+ on DGX A100 systems with DGX OS 5.1+.</p>
</div>
<p>Before installing the operator, ensure that the following configurations are modified depending on the container runtime configured in your cluster.</p>
<p>Docker:</p>
<blockquote>
<div><ul>
<li><p>Update the Docker configuration to add <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> as the default runtime. The <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime should
be setup as the default container runtime for Docker on GPU nodes. This can be done by adding the
<code class="docutils literal notranslate"><span class="pre">default-runtime</span></code> line into the Docker daemon config file, which is usually located on the system
at <code class="docutils literal notranslate"><span class="pre">/etc/docker/daemon.json</span></code>:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell9"><span></span><span class="go">{</span>
<span class="go">    "default-runtime": "nvidia",</span>
<span class="go">    "runtimes": {</span>
<span class="go">        "nvidia": {</span>
<span class="go">            "path": "/usr/bin/nvidia-container-runtime",</span>
<span class="go">            "runtimeArgs": []</span>
<span class="go">      }</span>
<span class="go">    }</span>
<span class="go">}</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell9">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Restart the Docker daemon to complete the installation after setting the default runtime:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell10"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>restart<span class="w"> </span>docker
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell10">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
</ul>
</div></blockquote>
<p>Containerd:</p>
<blockquote>
<div><ul>
<li><p>Update <code class="docutils literal notranslate"><span class="pre">containerd</span></code> to use <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> as the default runtime and add <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime configuration.
This can be done by adding below config to <code class="docutils literal notranslate"><span class="pre">/etc/containerd/config.toml</span></code> and restarting <code class="docutils literal notranslate"><span class="pre">containerd</span></code> service.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell11"><span></span><span class="go">version = 2</span>
<span class="go">[plugins]</span>
<span class="go">  [plugins."io.containerd.grpc.v1.cri"]</span>
<span class="go">    [plugins."io.containerd.grpc.v1.cri".containerd]</span>
<span class="go">      default_runtime_name = "nvidia"</span>

<span class="go">      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]</span>
<span class="go">        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia]</span>
<span class="go">          privileged_without_host_devices = false</span>
<span class="go">          runtime_engine = ""</span>
<span class="go">          runtime_root = ""</span>
<span class="go">          runtime_type = "io.containerd.runc.v2"</span>
<span class="go">          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia.options]</span>
<span class="go">            BinaryName = "/usr/bin/nvidia-container-runtime"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell11">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Restart the Containerd daemon to complete the installation after setting the default runtime:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell12"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>restart<span class="w"> </span>containerd
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell12">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
</ul>
</div></blockquote>
<p>Install the GPU operator with the following options:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell13"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">      </span>nvidia/gpu-operator<span class="w"> </span><span class="se">\</span>
<span class="w">      </span>--set<span class="w"> </span>driver.enabled<span class="o">=</span><span class="nb">false</span><span class="w"> </span><span class="se">\</span>
<span class="w">      </span>--set<span class="w"> </span>toolkit.enabled<span class="o">=</span><span class="nb">false</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell13">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<hr class="docutils">
<section id="bare-metal-passthrough-with-pre-installed-nvidia-container-toolkit-but-no-drivers">
<h5>Bare-metal/Passthrough with pre-installed NVIDIA Container Toolkit (but no drivers)<a class="headerlink" href="#bare-metal-passthrough-with-pre-installed-nvidia-container-toolkit-but-no-drivers" title="Permalink to this heading"></a></h5>
<p>In this example, the user has already pre-installed the NVIDIA Container Toolkit (<code class="docutils literal notranslate"><span class="pre">nvidia-docker2</span></code>) as part of the system image.</p>
<p>Before installing the operator, ensure that the following configurations are modified depending on the container runtime configured in your cluster.</p>
<p>Docker:</p>
<blockquote>
<div><ul>
<li><p>Update the Docker configuration to add <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> as the default runtime. The <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime should
be setup as the default container runtime for Docker on GPU nodes. This can be done by adding the
<code class="docutils literal notranslate"><span class="pre">default-runtime</span></code> line into the Docker daemon config file, which is usually located on the system
at <code class="docutils literal notranslate"><span class="pre">/etc/docker/daemon.json</span></code>:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell14"><span></span><span class="go">{</span>
<span class="go">    "default-runtime": "nvidia",</span>
<span class="go">    "runtimes": {</span>
<span class="go">        "nvidia": {</span>
<span class="go">            "path": "/usr/bin/nvidia-container-runtime",</span>
<span class="go">            "runtimeArgs": []</span>
<span class="go">      }</span>
<span class="go">    }</span>
<span class="go">}</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell14">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Restart the Docker daemon to complete the installation after setting the default runtime:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell15"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>restart<span class="w"> </span>docker
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell15">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
</ul>
</div></blockquote>
<p>Containerd:</p>
<blockquote>
<div><ul>
<li><p>Update <code class="docutils literal notranslate"><span class="pre">containerd</span></code> to use <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> as the default runtime and add <code class="docutils literal notranslate"><span class="pre">nvidia</span></code> runtime configuration.
This can be done by adding below config to <code class="docutils literal notranslate"><span class="pre">/etc/containerd/config.toml</span></code> and restarting <code class="docutils literal notranslate"><span class="pre">containerd</span></code> service.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell16"><span></span><span class="go">version = 2</span>
<span class="go">[plugins]</span>
<span class="go">  [plugins."io.containerd.grpc.v1.cri"]</span>
<span class="go">    [plugins."io.containerd.grpc.v1.cri".containerd]</span>
<span class="go">      default_runtime_name = "nvidia"</span>

<span class="go">      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes]</span>
<span class="go">        [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia]</span>
<span class="go">          privileged_without_host_devices = false</span>
<span class="go">          runtime_engine = ""</span>
<span class="go">          runtime_root = ""</span>
<span class="go">          runtime_type = "io.containerd.runc.v2"</span>
<span class="go">          [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia.options]</span>
<span class="go">            BinaryName = "/usr/bin/nvidia-container-runtime"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell16">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Restart the Containerd daemon to complete the installation after setting the default runtime:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell17"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>systemctl<span class="w"> </span>restart<span class="w"> </span>containerd
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell17">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
</ul>
</div></blockquote>
<p>Configure toolkit to use the <code class="docutils literal notranslate"><span class="pre">root</span></code> directory of the driver installation as <code class="docutils literal notranslate"><span class="pre">/run/nvidia/driver</span></code>, which is the path mounted by driver container.</p>
<blockquote>
<div><div class="highlight-console notranslate"><div class="highlight"><pre id="codecell18"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>sed<span class="w"> </span>-i<span class="w"> </span><span class="s1">'s/^#root/root/'</span><span class="w"> </span>/etc/nvidia-container-runtime/config.toml
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
<p>Once these steps are complete, now install the GPU operator with the following options (which will provision a driver):</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell19"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>toolkit.enabled<span class="o">=</span><span class="nb">false</span>
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
<hr class="docutils">
<section id="custom-driver-image-based-off-a-specific-driver-version">
<h5>Custom driver image (based off a specific driver version)<a class="headerlink" href="#custom-driver-image-based-off-a-specific-driver-version" title="Permalink to this heading"></a></h5>
<p>If you want to use custom driver container images (for e.g. using 465.27), then
you would need to build a new driver container image. Follow these steps:</p>
<ul>
<li><p>Rebuild the driver container by specifying the <code class="docutils literal notranslate"><span class="pre">$DRIVER_VERSION</span></code> argument when building the Docker image. For
reference, the driver container Dockerfiles are available on the Git repo <a class="reference external" href="https://gitlab.com/nvidia/container-images/driver">here</a></p></li>
<li><p>Build the container using the appropriate Dockerfile. For example:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell20"><span></span><span class="gp">$ </span>docker<span class="w"> </span>build<span class="w"> </span>--pull<span class="w"> </span>-t<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>--build-arg<span class="w"> </span><span class="nv">DRIVER_VERSION</span><span class="o">=</span><span class="m">455</span>.28<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>nvidia/driver:455.28-ubuntu20.04<span class="w"> </span><span class="se">\</span>
<span class="w">    </span>--file<span class="w"> </span>Dockerfile<span class="w"> </span>.
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell20">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Ensure that the driver container is tagged as shown in the example by using the <code class="docutils literal notranslate"><span class="pre">driver:&lt;version&gt;-&lt;os&gt;</span></code> schema.</p>
</li>
<li><p>Specify the new driver image and repository by overriding the defaults in
the Helm install command. For example:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell21"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>--wait<span class="w"> </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--create-namespace<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>nvidia/gpu-operator<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.repository<span class="o">=</span>docker.io/nvidia<span class="w"> </span><span class="se">\</span>
<span class="w">     </span>--set<span class="w"> </span>driver.version<span class="o">=</span><span class="s2">"465.27"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell21">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
</ul>
<p>Note that these instructions are provided for reference and evaluation purposes.
Not using the standard releases of the GPU Operator from NVIDIA would mean limited
support for such custom configurations.</p>
</section>
<hr class="docutils" id="custom-runtime-options">
<section id="custom-configuration-for-runtime-containerd">
<h5>Custom configuration for runtime <code class="docutils literal notranslate"><span class="pre">containerd</span></code><a class="headerlink" href="#custom-configuration-for-runtime-containerd" title="Permalink to this heading"></a></h5>
<p>When <cite>containerd</cite> is the container runtime used, the following configuration
options are used with the container-toolkit deployed with GPU Operator:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre id="codecell22"><span></span><span class="nt">toolkit</span><span class="p">:</span>
<span class="w">   </span><span class="nt">env</span><span class="p">:</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_CONFIG</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">/etc/containerd/config.toml</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_SOCKET</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">/run/containerd/containerd.sock</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_RUNTIME_CLASS</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">nvidia</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_SET_AS_DEFAULT</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">true</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell22">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>These options are defined as follows:</p>
<blockquote>
<div><ul>
<li><dl>
<dt><strong>CONTAINERD_CONFIG</strong><span class="classifier">The path on the host to the <code class="docutils literal notranslate"><span class="pre">containerd</span></code> config</span></dt><dd><p>you would like to have updated with support for the <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code>.
By default this will point to <code class="docutils literal notranslate"><span class="pre">/etc/containerd/config.toml</span></code> (the default
location for <code class="docutils literal notranslate"><span class="pre">containerd</span></code>). It should be customized if your <code class="docutils literal notranslate"><span class="pre">containerd</span></code>
installation is not in the default location.</p>
</dd>
</dl>
</li>
<li><dl class="simple">
<dt><strong>CONTAINERD_SOCKET</strong><span class="classifier">The path on the host to the socket file used to</span></dt><dd><p>communicate with <code class="docutils literal notranslate"><span class="pre">containerd</span></code>. The operator will use this to send a
<code class="docutils literal notranslate"><span class="pre">SIGHUP</span></code> signal to the <code class="docutils literal notranslate"><span class="pre">containerd</span></code> daemon to reload its config. By
default this will point to <code class="docutils literal notranslate"><span class="pre">/run/containerd/containerd.sock</span></code>
(the default location for <code class="docutils literal notranslate"><span class="pre">containerd</span></code>). It should be customized if
your <code class="docutils literal notranslate"><span class="pre">containerd</span></code> installation is not in the default location.</p>
</dd>
</dl>
</li>
<li><dl class="simple">
<dt><strong>CONTAINERD_RUNTIME_CLASS</strong><span class="classifier">The name of the</span></dt><dd><p><a class="reference external" href="https://kubernetes.io/docs/concepts/containers/runtime-class">Runtime Class</a>
you would like to associate with the <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code>.
Pods launched with a <code class="docutils literal notranslate"><span class="pre">runtimeClassName</span></code> equal to CONTAINERD_RUNTIME_CLASS
will always run with the <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code>. The default
CONTAINERD_RUNTIME_CLASS is <code class="docutils literal notranslate"><span class="pre">nvidia</span></code>.</p>
</dd>
</dl>
</li>
<li><dl class="simple">
<dt><strong>CONTAINERD_SET_AS_DEFAULT</strong><span class="classifier">A flag indicating whether you want to set</span></dt><dd><p><code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code> as the default runtime used to launch all
containers. When set to false, only containers in pods with a <code class="docutils literal notranslate"><span class="pre">runtimeClassName</span></code>
equal to CONTAINERD_RUNTIME_CLASS will be run with the <code class="docutils literal notranslate"><span class="pre">nvidia-container-runtime</span></code>.
The default value is <code class="docutils literal notranslate"><span class="pre">true</span></code>.</p>
</dd>
</dl>
</li>
</ul>
</div></blockquote>
<p>For using with RKE2 (Rancher Kubernetes Engine 2) or K3s following settings needs to be set in <cite>ClusterPolicy</cite>.</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre id="codecell23"><span></span><span class="nt">toolkit</span><span class="p">:</span>
<span class="w">   </span><span class="nt">env</span><span class="p">:</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_CONFIG</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">/var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_SOCKET</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">/run/k3s/containerd/containerd.sock</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_RUNTIME_CLASS</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">nvidia</span>
<span class="w">   </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">CONTAINERD_SET_AS_DEFAULT</span>
<span class="w">     </span><span class="nt">value</span><span class="p">:</span><span class="w"> </span><span class="s">"true"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell23">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>These options can be passed to GPU Operator during install time as below.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell24"><span></span><span class="go">helm install -n gpu-operator --create-namespace \</span>
<span class="go">  nvidia/gpu-operator $HELM_OPTIONS \</span>
<span class="go">    --set toolkit.env[0].name=CONTAINERD_CONFIG \</span>
<span class="go">    --set toolkit.env[0].value=/var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl \</span>
<span class="go">    --set toolkit.env[1].name=CONTAINERD_SOCKET \</span>
<span class="go">    --set toolkit.env[1].value=/run/k3s/containerd/containerd.sock \</span>
<span class="go">    --set toolkit.env[2].name=CONTAINERD_RUNTIME_CLASS \</span>
<span class="go">    --set toolkit.env[2].value=nvidia \</span>
<span class="go">    --set toolkit.env[3].name=CONTAINERD_SET_AS_DEFAULT \</span>
<span class="go">    --set-string toolkit.env[3].value=true</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell24">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<hr class="docutils">
<section id="proxy-environments">
<h5>Proxy Environments<a class="headerlink" href="#proxy-environments" title="Permalink to this heading"></a></h5>
<p>Refer to the section <a class="reference internal" href="install-gpu-operator-proxy.html#install-gpu-operator-proxy"><span class="std std-ref">Install GPU Operator in Proxy Environments</span></a> for more information on how to install the Operator on clusters
behind a HTTP proxy.</p>
</section>
<hr class="docutils">
<section id="air-gapped-environments">
<h5>Air-gapped Environments<a class="headerlink" href="#air-gapped-environments" title="Permalink to this heading"></a></h5>
<p>Refer to the section <a class="reference internal" href="install-gpu-operator-air-gapped.html#install-gpu-operator-air-gapped"><span class="std std-ref">Install GPU Operator in Air-gapped Environments</span></a> for more information on how to install the Operator
in air-gapped environments.</p>
</section>
<hr class="docutils">
<section id="multi-instance-gpu-mig">
<h5>Multi-Instance GPU (MIG)<a class="headerlink" href="#multi-instance-gpu-mig" title="Permalink to this heading"></a></h5>
<p>Refer to the document <a class="reference internal" href="gpu-operator-mig.html#install-gpu-operator-mig"><span class="std std-ref">GPU Operator with MIG</span></a> for more information on how use the Operator with Multi-Instance GPU (MIG)
on NVIDIA Ampere products. For guidance on configuring MIG support for the <strong>NVIDIA GPU Operator</strong> in an OpenShift Container Platform cluster, see the <a class="reference external" href="https://docs.nvidia.com/datacenter/cloud-native/openshift/mig-ocp.html">user guide</a>.</p>
</section>
<hr class="docutils">
<section id="kubevirt-openshift-virtualization">
<h5>KubeVirt / OpenShift Virtualization<a class="headerlink" href="#kubevirt-openshift-virtualization" title="Permalink to this heading"></a></h5>
<p>Refer to the document <a class="reference internal" href="gpu-operator-kubevirt.html#gpu-operator-kubevirt"><span class="std std-ref">GPU Operator with KubeVirt</span></a> for more information on how to use the GPU Operator to provision GPU nodes for running KubeVirt virtual machines with access to GPU.
For guidance on using the GPU Operator with OpenShift Virtualization, refer to the document <span class="xref std std-ref">nvidia-gpu-operator-openshift-virtualization-vgpu-enablement</span>.</p>
</section>
<section id="outdated-kernels">
<h5>Outdated Kernels<a class="headerlink" href="#outdated-kernels" title="Permalink to this heading"></a></h5>
<p>Refer to the section <a class="reference internal" href="install-gpu-operator-outdated-kernels.html#install-gpu-operator-outdated-kernels"><span class="std std-ref">Considerations when Installing with Outdated Kernels in Cluster</span></a> for more information on how to install the Operator successfully
when nodes in the cluster are not running the latest kernel</p>
</section>
</section>
<hr class="docutils">
<section id="verify-gpu-operator-install">
<h4>Verify GPU Operator Install<a class="headerlink" href="#verify-gpu-operator-install" title="Permalink to this heading"></a></h4>
<p>Once the Helm chart is installed, check the status of the pods to ensure all the containers are running and the validation is complete:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell25"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>pods<span class="w"> </span>-n<span class="w"> </span>gpu-operator
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell25">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell26"><span></span><span class="go">NAME                                                          READY   STATUS      RESTARTS   AGE</span>
<span class="go">gpu-feature-discovery-crrsq                                   1/1     Running     0          60s</span>
<span class="go">gpu-operator-7fb75556c7-x8spj                                 1/1     Running     0          5m13s</span>
<span class="go">gpu-operator-node-feature-discovery-master-58d884d5cc-w7q7b   1/1     Running     0          5m13s</span>
<span class="go">gpu-operator-node-feature-discovery-worker-6rht2              1/1     Running     0          5m13s</span>
<span class="go">gpu-operator-node-feature-discovery-worker-9r8js              1/1     Running     0          5m13s</span>
<span class="go">nvidia-container-toolkit-daemonset-lhgqf                      1/1     Running     0          4m53s</span>
<span class="go">nvidia-cuda-validator-rhvbb                                   0/1     Completed   0          54s</span>
<span class="go">nvidia-dcgm-5jqzg                                             1/1     Running     0          60s</span>
<span class="go">nvidia-dcgm-exporter-h964h                                    1/1     Running     0          60s</span>
<span class="go">nvidia-device-plugin-daemonset-d9ntc                          1/1     Running     0          60s</span>
<span class="go">nvidia-device-plugin-validator-cm2fd                          0/1     Completed   0          48s</span>
<span class="go">nvidia-driver-daemonset-5xj6g                                 1/1     Running     0          4m53s</span>
<span class="go">nvidia-mig-manager-89z9b                                      1/1     Running     0          4m53s</span>
<span class="go">nvidia-operator-validator-bwx99                               1/1     Running     0          58s</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell26">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>We can now proceed to running some sample GPU workloads to verify that the Operator (and its components) are working correctly.</p>
</section>
</section>
</section>
<section id="running-sample-gpu-applications">
<h2>Running Sample GPU Applications<a class="headerlink" href="#running-sample-gpu-applications" title="Permalink to this heading"></a></h2>
<section id="cuda-vectoradd">
<h3>CUDA VectorAdd<a class="headerlink" href="#cuda-vectoradd" title="Permalink to this heading"></a></h3>
<p>In the first example, let’s run a simple CUDA sample, which adds two vectors together:</p>
<ol class="arabic">
<li><p>Create a file, such as <code class="docutils literal notranslate"><span class="pre">cuda-vectoradd.yaml</span></code>, with contents like the following:</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre id="codecell27"><span></span><span class="nt">apiVersion</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">v1</span>
<span class="nt">kind</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">Pod</span>
<span class="nt">metadata</span><span class="p">:</span>
<span class="w">  </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">cuda-vectoradd</span>
<span class="nt">spec</span><span class="p">:</span>
<span class="w">  </span><span class="nt">restartPolicy</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">OnFailure</span>
<span class="w">  </span><span class="nt">containers</span><span class="p">:</span>
<span class="w">  </span><span class="p p-Indicator">-</span><span class="w"> </span><span class="nt">name</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">cuda-vectoradd</span>
<span class="w">    </span><span class="nt">image</span><span class="p">:</span><span class="w"> </span><span class="s">"nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda11.7.1-ubuntu20.04"</span>
<span class="w">    </span><span class="nt">resources</span><span class="p">:</span>
<span class="w">      </span><span class="nt">limits</span><span class="p">:</span>
<span class="w">        </span><span class="nt">nvidia.com/gpu</span><span class="p">:</span><span class="w"> </span><span class="l l-Scalar l-Scalar-Plain">1</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell27">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Run the pod:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell28"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>apply<span class="w"> </span>-f<span class="w"> </span>cuda-vectoradd.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell28">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>The pod starts, runs the <code class="docutils literal notranslate"><span class="pre">vectorAdd</span></code> command, and then exits.</p>
</li>
<li><p>View the logs from the container:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell29"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>logs<span class="w"> </span>pod/cuda-vectoradd
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell29">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p><em>Example Output</em></p>
<div class="highlight-output notranslate"><div class="highlight"><pre id="codecell30"><span></span><span class="go">[Vector addition of 50000 elements]</span>
<span class="go">Copy input data from the host memory to the CUDA device</span>
<span class="go">CUDA kernel launch with 196 blocks of 256 threads</span>
<span class="go">Copy output data from the CUDA device to the host memory</span>
<span class="go">Test PASSED</span>
<span class="go">Done</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell30">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</li>
<li><p>Removed the stopped pod:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell31"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>delete<span class="w"> </span>-f<span class="w"> </span>cuda-vectoradd.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell31">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p><em>Example Output</em></p>
<div class="highlight-output notranslate"><div class="highlight"><pre id="codecell32"><span></span><span class="go">pod "cuda-vectoradd" deleted</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell32">
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
<section id="jupyter-notebook">
<h3>Jupyter Notebook<a class="headerlink" href="#jupyter-notebook" title="Permalink to this heading"></a></h3>
<p>In the next example, let’s try running a TensorFlow Jupyter notebook.</p>
<p>First, deploy the pods:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell33"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>apply<span class="w"> </span>-f<span class="w"> </span>https://nvidia.github.io/gpu-operator/notebook-example.yml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell33">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Check to determine if the pod has successfully started:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell34"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>pod<span class="w"> </span>tf-notebook
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell34">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell35"><span></span><span class="go">NAMESPACE                NAME                                                              READY   STATUS      RESTARTS   AGE</span>
<span class="go">default                  tf-notebook                                                       1/1     Running     0          3m45s</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell35">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Since the example also includes a service, let’s obtain the external port at which the notebook is accessible:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell36"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>svc<span class="w"> </span>-A
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell36">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell37"><span></span><span class="go">NAMESPACE                NAME                                                    TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE</span>
<span class="go">default                  tf-notebook                                             NodePort    10.106.229.20   &lt;none&gt;        80:30001/TCP             4m41s</span>
<span class="go">..</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell37">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>And the token for the Jupyter notebook:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell38"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>logs<span class="w"> </span>tf-notebook
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell38">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell39"><span></span><span class="go">[I 21:50:23.188 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret</span>
<span class="go">[I 21:50:23.390 NotebookApp] Serving notebooks from local directory: /tf</span>
<span class="go">[I 21:50:23.391 NotebookApp] The Jupyter Notebook is running at:</span>
<span class="go">[I 21:50:23.391 NotebookApp] http://tf-notebook:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9</span>
<span class="go">[I 21:50:23.391 NotebookApp]  or http://127.0.0.1:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9</span>
<span class="go">[I 21:50:23.391 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).</span>
<span class="go">[C 21:50:23.394 NotebookApp]</span>

<span class="go">   To access the notebook, open this file in a browser:</span>
<span class="go">      file:///root/.local/share/jupyter/runtime/nbserver-1-open.html</span>
<span class="go">   Or copy and paste one of these URLs:</span>
<span class="go">      http://tf-notebook:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9</span>
<span class="go">   or http://127.0.0.1:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell39">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>The notebook should now be accessible from your browser at this URL: <code class="docutils literal notranslate"><span class="pre">http:://&lt;your-machine-ip&gt;:30001/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9</span></code></p>
</section>
</section>
<section id="demo">
<h2>Demo<a class="headerlink" href="#demo" title="Permalink to this heading"></a></h2>
<p>Check out the demo below where we scale GPU nodes in a K8s cluster using the GPU Operator:</p>
<a class="reference internal image-reference" href="../_images/gpu-operator-demo8.gif"><img alt="../_images/gpu-operator-demo8.gif" src="../_images/gpu-operator-demo8.gif" style="width: 1440px;"></a>
</section>
<section id="gpu-telemetry">
<h2>GPU Telemetry<a class="headerlink" href="#gpu-telemetry" title="Permalink to this heading"></a></h2>
<p>To gather GPU telemetry in Kubernetes, the GPU Operator deploys the <code class="docutils literal notranslate"><span class="pre">dcgm-exporter</span></code>. <code class="docutils literal notranslate"><span class="pre">dcgm-exporter</span></code>, based
on <a class="reference external" href="https://developer.nvidia.com/dcgm">DCGM</a> exposes GPU metrics for Prometheus and can be visualized using Grafana. <code class="docutils literal notranslate"><span class="pre">dcgm-exporter</span></code> is architected to take advantage of
<code class="docutils literal notranslate"><span class="pre">KubeletPodResources</span></code> <a class="reference external" href="https://kubernetes.io/docs/reference/command-line-tools-reference/feature-gates/">API</a> and exposes GPU metrics in a format that can be
scraped by Prometheus.</p>
<section id="custom-metrics-config">
<h3>Custom Metrics Config<a class="headerlink" href="#custom-metrics-config" title="Permalink to this heading"></a></h3>
<p>With GPU Operator users can customize the metrics to be collected by <code class="docutils literal notranslate"><span class="pre">dcgm-exporter</span></code>. Below are the steps for this</p>
<blockquote>
<div><ol class="arabic simple">
<li><p>Fetch the metrics file and save as dcgm-metrics.csv</p></li>
</ol>
<blockquote>
<div><div class="highlight-console notranslate"><div class="highlight"><pre id="codecell40"><span></span><span class="gp">$ </span>curl<span class="w"> </span>https://raw.githubusercontent.com/NVIDIA/dcgm-exporter/main/etc/dcp-metrics-included.csv<span class="w"> </span>&gt;<span class="w"> </span>dcgm-metrics.csv
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell40">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</div></blockquote>
<ol class="arabic simple" start="2">
<li><p>Edit the metrics file as required to add/remove any metrics to be collected.</p></li>
<li><p>Create a Namespace <code class="docutils literal notranslate"><span class="pre">gpu-operator</span></code> if one is not already present.</p></li>
</ol>
<blockquote>
<div><div class="highlight-console notranslate"><div class="highlight"><pre id="codecell41"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>create<span class="w"> </span>namespace<span class="w"> </span>gpu-operator
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell41">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</div></blockquote>
<ol class="arabic simple" start="4">
<li><p>Create a ConfigMap using the file edited above.</p></li>
</ol>
<blockquote>
<div><div class="highlight-console notranslate"><div class="highlight"><pre id="codecell42"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>create<span class="w"> </span>configmap<span class="w"> </span>metrics-config<span class="w"> </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--from-file<span class="o">=</span>dcgm-metrics.csv
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell42">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</div></blockquote>
<ol class="arabic simple" start="5">
<li><p>Install GPU Operator with additional options <code class="docutils literal notranslate"><span class="pre">--set</span> <span class="pre">dcgmExporter.config.name=metrics-config</span></code> and
<code class="docutils literal notranslate"><span class="pre">--set</span> <span class="pre">dcgmExporter.env[0].name=DCGM_EXPORTER_COLLECTORS</span> <span class="pre">--set</span> <span class="pre">dcgmExporter.env[0].value=/etc/dcgm-exporter/dcgm-metrics.csv</span></code></p></li>
</ol>
</div></blockquote>
</section>
<section id="collecting-metrics-on-nvidia-dgx-a100-with-dgx-os">
<h3>Collecting Metrics on NVIDIA DGX A100 with DGX OS<a class="headerlink" href="#collecting-metrics-on-nvidia-dgx-a100-with-dgx-os" title="Permalink to this heading"></a></h3>
<p>NVIDIA DGX systems running with DGX OS bundles drivers, DCGM, etc. in the system image and have <cite>nv-hostengine</cite> running already.
To avoid any compatibility issues, it is recommended to have <cite>dcgm-exporter</cite> connect to the existing <cite>nv-hostengine</cite> daemon to gather/publish
GPU telemetry data.</p>
<div class="admonition warning">
<p class="admonition-title">Warning</p>
<p>The <cite>dcgm-exporter</cite> container image includes a DCGM client library (<code class="docutils literal notranslate"><span class="pre">libdcgm.so</span></code>) to communicate with
<cite>nv-hostengine</cite>. In this deployment scenario we have <cite>dcgm-exporter</cite> (or rather <code class="docutils literal notranslate"><span class="pre">libdcgm.so</span></code>) connect
to an existing <cite>nv-hostengine</cite> running on the host. The DCGM client library uses an internal protocol to exchange
information with <cite>nv-hostengine</cite>. To avoid any potential incompatibilities between the container image’s DCGM client library
and the host’s <cite>nv-hostengine</cite>, it is strongly recommended to use a version of DCGM on which <cite>dcgm-exporter</cite> is based is
greater than or equal to (but not less than) the version of DCGM running on the host. This can be easily determined by
comparing the version tags of the <cite>dcgm-exporter</cite> image and by running <code class="docutils literal notranslate"><span class="pre">nv-hostengine</span> <span class="pre">--version</span></code> on the host.</p>
</div>
<p>In this scenario, we need to set <code class="docutils literal notranslate"><span class="pre">DCGM_REMOTE_HOSTENGINE_INFO</span></code> to <code class="docutils literal notranslate"><span class="pre">localhost:5555</span></code> for <cite>dcgm-exporter</cite> to connect to <cite>nv-hostengine</cite> running on the host.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell43"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>patch<span class="w"> </span>clusterpolicy/cluster-policy<span class="w"> </span>--type<span class="o">=</span><span class="s1">'json'</span><span class="w"> </span>-p<span class="o">=</span><span class="s1">'[{"op": "add", "path": "/spec/dcgmExporter/env/-", "value":{"name":"DCGM_REMOTE_HOSTENGINE_INFO", "value":"localhost:5555"}}]'</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell43">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Verify <cite>dcgm-exporter</cite> pod is running after this change</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell44"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>pods<span class="w"> </span>-l<span class="w"> </span><span class="nv">app</span><span class="o">=</span>nvidia-dcgm-exporter<span class="w"> </span>--all-namespaces
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell44">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>The rest of this section walks through how to setup Prometheus, Grafana using Operators and using Prometheus with <code class="docutils literal notranslate"><span class="pre">dcgm-exporter</span></code>.</p>
</section>
<section id="setting-up-prometheus">
<h3>Setting up Prometheus<a class="headerlink" href="#setting-up-prometheus" title="Permalink to this heading"></a></h3>
<p>Implementing a Prometheus stack can be complicated but can be managed by taking advantage of the <code class="docutils literal notranslate"><span class="pre">Helm</span></code> package manager and
the <a class="reference external" href="https://github.com/coreos/prometheus-operator">Prometheus Operator</a> and <a class="reference external" href="https://github.com/coreos/kube-prometheus">kube-prometheus</a> projects.
The Operator uses standard configurations and dashboards for Prometheus and Grafana and the Helm <a class="reference external" href="https://github.com/helm/charts/tree/master/stable/prometheus-operator">prometheus-operator</a>
chart allows you to get a full cluster monitoring solution up and running by installing Prometheus Operator and the rest of the components listed above.</p>
<p>First, add the <code class="docutils literal notranslate"><span class="pre">helm</span></code> repo:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell45"><span></span><span class="gp">$ </span>helm<span class="w"> </span>repo<span class="w"> </span>add<span class="w"> </span>prometheus-community<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>https://prometheus-community.github.io/helm-charts
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell45">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Now, search for the available <code class="docutils literal notranslate"><span class="pre">prometheus</span></code> charts:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell46"><span></span><span class="gp">$ </span>helm<span class="w"> </span>search<span class="w"> </span>repo<span class="w"> </span>kube-prometheus
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell46">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Once you’ve located which the version of the chart to use, inspect the chart so we can modify the settings:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell47"><span></span><span class="gp">$ </span>helm<span class="w"> </span>inspect<span class="w"> </span>values<span class="w"> </span>prometheus-community/kube-prometheus-stack<span class="w"> </span>&gt;<span class="w"> </span>/tmp/kube-prometheus-stack.values
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell47">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Next, we’ll need to edit the values file to change the port at which the Prometheus server service is available. In the <code class="docutils literal notranslate"><span class="pre">prometheus</span></code> instance
section of the chart, change the service type from <code class="docutils literal notranslate"><span class="pre">ClusterIP</span></code> to <code class="docutils literal notranslate"><span class="pre">NodePort</span></code>. This will allow the Prometheus server to be accessible at your
machine ip address at port 30090 as <code class="docutils literal notranslate"><span class="pre">http://&lt;machine-ip&gt;:30090/</span></code></p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell48"><span></span><span class="go">From:</span>
<span class="gp"> #</span><span class="c1"># Port to expose on each node</span>
<span class="gp"> #</span><span class="c1"># Only used if service.type is 'NodePort'</span>
<span class="gp"> #</span><span class="c1">#</span>
<span class="go"> nodePort: 30090</span>

<span class="gp"> #</span><span class="c1"># Loadbalancer IP</span>
<span class="gp"> #</span><span class="c1"># Only use if service.type is "loadbalancer"</span>
<span class="go"> loadBalancerIP: ""</span>
<span class="go"> loadBalancerSourceRanges: []</span>
<span class="gp"> #</span><span class="c1"># Service type</span>
<span class="gp"> #</span><span class="c1">#</span>
<span class="go"> type: ClusterIP</span>

<span class="go">To:</span>
<span class="gp"> #</span><span class="c1"># Port to expose on each node</span>
<span class="gp"> #</span><span class="c1"># Only used if service.type is 'NodePort'</span>
<span class="gp"> #</span><span class="c1">#</span>
<span class="go"> nodePort: 30090</span>

<span class="gp"> #</span><span class="c1"># Loadbalancer IP</span>
<span class="gp"> #</span><span class="c1"># Only use if service.type is "loadbalancer"</span>
<span class="go"> loadBalancerIP: ""</span>
<span class="go"> loadBalancerSourceRanges: []</span>
<span class="gp"> #</span><span class="c1"># Service type</span>
<span class="gp"> #</span><span class="c1">#</span>
<span class="go"> type: NodePort</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell48">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Also, modify the <code class="docutils literal notranslate"><span class="pre">prometheusSpec.serviceMonitorSelectorNilUsesHelmValues</span></code> settings to <code class="docutils literal notranslate"><span class="pre">false</span></code> below:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell49"><span></span><span class="gp">#</span><span class="c1"># If true, a nil or {} value for prometheus.prometheusSpec.serviceMonitorSelector will cause the</span>
<span class="gp">#</span><span class="c1"># prometheus resource to be created with selectors based on values in the helm deployment,</span>
<span class="gp">#</span><span class="c1"># which will also match the servicemonitors created</span>
<span class="gp">#</span><span class="c1">#</span>
<span class="go">serviceMonitorSelectorNilUsesHelmValues: false</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell49">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Add the following <code class="docutils literal notranslate"><span class="pre">configMap</span></code> to the section on <code class="docutils literal notranslate"><span class="pre">additionalScrapeConfigs</span></code> in the Helm chart.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell50"><span></span><span class="gp">#</span><span class="c1"># AdditionalScrapeConfigs allows specifying additional Prometheus scrape configurations. Scrape configurations</span>
<span class="gp">#</span><span class="c1"># are appended to the configurations generated by the Prometheus Operator. Job configurations must have the form</span>
<span class="gp">#</span><span class="c1"># as specified in the official Prometheus documentation:</span>
<span class="gp">#</span><span class="c1"># https://prometheus.io/docs/prometheus/latest/configuration/configuration/#scrape_config. As scrape configs are</span>
<span class="gp">#</span><span class="c1"># appended, the user is responsible to make sure it is valid. Note that using this feature may expose the possibility</span>
<span class="gp">#</span><span class="c1"># to break upgrades of Prometheus. It is advised to review Prometheus release notes to ensure that no incompatible</span>
<span class="gp">#</span><span class="c1"># scrape configs are going to break Prometheus after the upgrade.</span>
<span class="gp">#</span><span class="c1">#</span>
<span class="gp">#</span><span class="c1"># The scrape configuration example below will find master nodes, provided they have the name .*mst.*, relabel the</span>
<span class="gp">#</span><span class="c1"># port to 2379 and allow etcd scraping provided it is running on all Kubernetes master nodes</span>
<span class="gp">#</span><span class="c1">#</span>
<span class="go">additionalScrapeConfigs:</span>
<span class="go">- job_name: gpu-metrics</span>
<span class="go">  scrape_interval: 1s</span>
<span class="go">  metrics_path: /metrics</span>
<span class="go">  scheme: http</span>
<span class="go">  kubernetes_sd_configs:</span>
<span class="go">  - role: endpoints</span>
<span class="go">    namespaces:</span>
<span class="go">      names:</span>
<span class="go">      - gpu-operator</span>
<span class="go">  relabel_configs:</span>
<span class="go">  - source_labels: [__meta_kubernetes_pod_node_name]</span>
<span class="go">    action: replace</span>
<span class="go">    target_label: kubernetes_node</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell50">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Finally, we can deploy the Prometheus and Grafana pods using the <code class="docutils literal notranslate"><span class="pre">kube-prometheus-stack</span></code> via Helm:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell51"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>prometheus-community/kube-prometheus-stack<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--create-namespace<span class="w"> </span>--namespace<span class="w"> </span>prometheus<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--values<span class="w"> </span>/tmp/kube-prometheus-stack.values
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell51">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<p>You can also override values in the Prometheus chart directly on the Helm command line:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell52"><span></span><span class="gp">$ </span>helm<span class="w"> </span>install<span class="w"> </span>prometheus-community/kube-prometheus-stack<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--create-namespace<span class="w"> </span>--namespace<span class="w"> </span>prometheus<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--generate-name<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--set<span class="w"> </span>prometheus.service.type<span class="o">=</span>NodePort<span class="w"> </span><span class="se">\</span>
<span class="w">   </span>--set<span class="w"> </span>prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues<span class="o">=</span><span class="nb">false</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell52">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</div>
<p>You should see a console output as below:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell53"><span></span><span class="go">NAME: kube-prometheus-stack-1637791640</span>
<span class="go">LAST DEPLOYED: Wed Nov 24 22:07:22 2021</span>
<span class="go">NAMESPACE: prometheus</span>
<span class="go">STATUS: deployed</span>
<span class="go">REVISION: 1</span>
<span class="go">NOTES:</span>
<span class="go">kube-prometheus-stack has been installed. Check its status by running:</span>
<span class="go">  kubectl --namespace prometheus get pods -l "release=kube-prometheus-stack-1637791640"</span>

<span class="go">Visit https://github.com/prometheus-operator/kube-prometheus for instructions on how to create &amp; configure Alertmanager and Prometheus instances using the Operator.</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell53">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Now you can see the Prometheus and Grafana pods:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell54"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>pods<span class="w"> </span>-n<span class="w"> </span>prometheus
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell54">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell55"><span></span><span class="go">NAME                                                              READY   STATUS    RESTARTS   AGE</span>
<span class="go">alertmanager-kube-prometheus-stack-1637-alertmanager-0            2/2     Running   0          23s</span>
<span class="go">kube-prometheus-stack-1637-operator-7bd6d6455c-pcv6n              1/1     Running   0          25s</span>
<span class="go">kube-prometheus-stack-1637791640-grafana-f99f499df-kwm4f          2/2     Running   0          25s</span>
<span class="go">kube-prometheus-stack-1637791640-kube-state-metrics-65bf4526xnl   1/1     Running   0          25s</span>
<span class="go">kube-prometheus-stack-1637791640-prometheus-node-exporter-8pwc4   1/1     Running   0          25s</span>
<span class="go">kube-prometheus-stack-1637791640-prometheus-node-exporter-nvzhq   1/1     Running   0          25s</span>
<span class="go">prometheus-kube-prometheus-stack-1637-prometheus-0                2/2     Running   0          23s</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell55">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>You can view the services setup as part of the operator and <code class="docutils literal notranslate"><span class="pre">dcgm-exporter</span></code>:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell56"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>svc<span class="w"> </span>-A
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell56">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell57"><span></span><span class="go">NAMESPACE      NAME                                                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                        AGE</span>
<span class="go">default        kubernetes                                                  ClusterIP   10.96.0.1        &lt;none&gt;        443/TCP                        34d</span>
<span class="go">gpu-operator   gpu-operator                                                ClusterIP   10.106.165.20    &lt;none&gt;        8080/TCP                       29m</span>
<span class="go">gpu-operator   gpu-operator-node-feature-discovery-master                  ClusterIP   10.102.207.205   &lt;none&gt;        8080/TCP                       30m</span>
<span class="go">gpu-operator   nvidia-dcgm-exporter                                        ClusterIP   10.108.99.82     &lt;none&gt;        9400/TCP                       29m</span>
<span class="go">kube-system    kube-dns                                                    ClusterIP   10.96.0.10       &lt;none&gt;        53/UDP,53/TCP,9153/TCP         34d</span>
<span class="go">kube-system    kube-prometheus-stack-1637-coredns                          ClusterIP   None             &lt;none&gt;        9153/TCP                       56s</span>
<span class="go">kube-system    kube-prometheus-stack-1637-kube-controller-manager          ClusterIP   None             &lt;none&gt;        10252/TCP                      56s</span>
<span class="go">kube-system    kube-prometheus-stack-1637-kube-etcd                        ClusterIP   None             &lt;none&gt;        2379/TCP                       56s</span>
<span class="go">kube-system    kube-prometheus-stack-1637-kube-proxy                       ClusterIP   None             &lt;none&gt;        10249/TCP                      56s</span>
<span class="go">kube-system    kube-prometheus-stack-1637-kube-scheduler                   ClusterIP   None             &lt;none&gt;        10251/TCP                      56s</span>
<span class="go">kube-system    kube-prometheus-stack-1637-kubelet                          ClusterIP   None             &lt;none&gt;        10250/TCP,10255/TCP,4194/TCP   6m42s</span>
<span class="go">prometheus     alertmanager-operated                                       ClusterIP   None             &lt;none&gt;        9093/TCP,9094/TCP,9094/UDP     54s</span>
<span class="go">prometheus     kube-prometheus-stack-1637-alertmanager                     ClusterIP   10.99.137.105    &lt;none&gt;        9093/TCP                       56s</span>
<span class="go">prometheus     kube-prometheus-stack-1637-operator                         ClusterIP   10.101.198.43    &lt;none&gt;        443/TCP                        56s</span>
<span class="go">prometheus     kube-prometheus-stack-1637-prometheus                       NodePort    10.105.175.245   &lt;none&gt;        9090:30090/TCP                 56s</span>
<span class="go">prometheus     kube-prometheus-stack-1637791640-grafana                    ClusterIP   10.111.115.192   &lt;none&gt;        80/TCP                         56s</span>
<span class="go">prometheus     kube-prometheus-stack-1637791640-kube-state-metrics         ClusterIP   10.105.66.181    &lt;none&gt;        8080/TCP                       56s</span>
<span class="go">prometheus     kube-prometheus-stack-1637791640-prometheus-node-exporter   ClusterIP   10.108.72.70     &lt;none&gt;        9100/TCP                       56s</span>
<span class="go">prometheus     prometheus-operated                                         ClusterIP   None             &lt;none&gt;        9090/TCP                       54s</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell57">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>You can observe that the Prometheus server is available at port 30090 on the node’s IP address. Open your browser to <code class="docutils literal notranslate"><span class="pre">http://&lt;machine-ip-address&gt;:30090</span></code>.
It may take a few minutes for DCGM to start publishing the metrics to Prometheus. The metrics availability can be verified by typing <code class="docutils literal notranslate"><span class="pre">DCGM_FI_DEV_GPU_UTIL</span></code>
in the event bar to determine if the GPU metrics are visible:</p>
<a class="reference internal image-reference" href="../_images/001-dcgm-e2e-prom-screenshot.png"><img alt="../_images/001-dcgm-e2e-prom-screenshot.png" src="../_images/001-dcgm-e2e-prom-screenshot.png" style="width: 800px;"></a>
</section>
<section id="using-grafana">
<h3>Using Grafana<a class="headerlink" href="#using-grafana" title="Permalink to this heading"></a></h3>
<p>You can also launch the Grafana tools for visualizing the GPU metrics.</p>
<p>There are two mechanisms for dealing with the ports on which Grafana is available - the service can be patched or port-forwarding can be used to reach the home page.
Either option can be chosen based on preference.</p>
<section id="patching-the-grafana-service">
<h4>Patching the Grafana Service<a class="headerlink" href="#patching-the-grafana-service" title="Permalink to this heading"></a></h4>
<p>By default, Grafana uses a <code class="docutils literal notranslate"><span class="pre">ClusterIP</span></code> to expose the ports on which the service is accessible. This can be changed to a <code class="docutils literal notranslate"><span class="pre">NodePort</span></code> instead, so the page is accessible
from the browser, similar to the Prometheus dashboard.</p>
<p>You can use <a class="reference external" href="https://kubernetes.io/docs/tasks/manage-kubernetes-objects/update-api-object-kubectl-patch/">kubectl patch</a> to update the service API
object to expose a <code class="docutils literal notranslate"><span class="pre">NodePort</span></code> instead.</p>
<p>First, modify the spec to change the service type:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell58"><span></span><span class="gp">$ </span>cat<span class="w"> </span>&lt;&lt;<span class="w"> </span>EOF<span class="w"> </span><span class="p">|</span><span class="w"> </span>tee<span class="w"> </span>grafana-patch.yaml
<span class="go">spec:</span>
<span class="go">  type: NodePort</span>
<span class="go">  nodePort: 32322</span>
<span class="go">EOF</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell58">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>And now use <code class="docutils literal notranslate"><span class="pre">kubectl</span> <span class="pre">patch</span></code>:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell59"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>patch<span class="w"> </span>svc<span class="w"> </span>prometheus-operator-1637791640-grafana<span class="w"> </span>-n<span class="w"> </span>prometheus<span class="w"> </span>--patch<span class="w"> </span><span class="s2">"</span><span class="k">$(</span>cat<span class="w"> </span>grafana-patch.yaml<span class="k">)</span><span class="s2">"</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell59">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell60"><span></span><span class="go">service/prometheus-operator-1637791640-grafana patched</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell60">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>You can verify that the service is now exposed at an externally accessible port:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell61"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>svc<span class="w"> </span>-A
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell61">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell62"><span></span><span class="go">NAMESPACE     NAME                                                      TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                        AGE</span>
<span class="go">&lt;snip&gt;</span>
<span class="go">prometheus    prometheus-operator-1637791640-grafana                    NodePort    10.111.115.192   &lt;none&gt;        80:32258/TCP                   2m2s</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell62">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Open your browser to <code class="docutils literal notranslate"><span class="pre">http://&lt;machine-ip-address&gt;:32258</span></code> and view the Grafana login page. Access Grafana home using the <code class="docutils literal notranslate"><span class="pre">admin</span></code> username.
The password credentials for the login are available in the <code class="docutils literal notranslate"><span class="pre">prometheus.values</span></code> file we edited in the earlier section of the doc:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell63"><span></span><span class="gp">#</span><span class="c1"># Deploy default dashboards.</span>
<span class="gp">#</span><span class="c1">#</span>
<span class="go">defaultDashboardsEnabled: true</span>

<span class="go">adminPassword: prom-operator</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell63">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<a class="reference internal image-reference" href="../_images/002-dcgm-e2e-grafana-screenshot.png"><img alt="../_images/002-dcgm-e2e-grafana-screenshot.png" src="../_images/002-dcgm-e2e-grafana-screenshot.png" style="width: 800px;"></a>
</section>
</section>
</section>
<section id="upgrade">
<span id="operator-upgrades"></span><h2>Upgrade<a class="headerlink" href="#upgrade" title="Permalink to this heading"></a></h2>
<section id="using-helm">
<h3>Using Helm<a class="headerlink" href="#using-helm" title="Permalink to this heading"></a></h3>
<p>Starting with GPU Operator v1.8.0, the GPU Operator supports dynamic updates to existing resources. This allows
the GPU Operator to ensure settings from the <cite>ClusterPolicy</cite> Spec are always applied and current.</p>
<p>Since Helm does not <a class="reference external" href="https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#some-caveats-and-explanations">support</a> auto upgrade of existing CRDs, the user has following options to
upgrade the GPU Operator chart:</p>
<section id="option-1-manually-upgrade-crd">
<h4>Option 1 - manually upgrade CRD<a class="headerlink" href="#option-1-manually-upgrade-crd" title="Permalink to this heading"></a></h4>
<div class="align-default"><img height="120" src="../_images/blockdiag-369eda0a7f3f131de010bca25d186c7a6a920e0e.png" width="448"></div>
<p>With this workflow, all existing GPU operator resources are updated inline and the <cite>ClusterPolicy</cite> resource is patched with updates from <code class="docutils literal notranslate"><span class="pre">values.yaml</span></code>.</p>
<p>Download the CRD from the specific <cite>&lt;release-tag&gt;</cite> from the Git repo. For example:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell64"><span></span><span class="gp">$ </span>wget<span class="w"> </span>https://gitlab.com/nvidia/kubernetes/gpu-operator/-/raw/&lt;release-tag&gt;/deployments/gpu-operator/crds/nvidia.com_clusterpolicies_crd.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell64">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Apply the CRD using the file downloaded above:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell65"><span></span><span class="gp">$  </span>kubectl<span class="w"> </span>apply<span class="w"> </span>-f<span class="w"> </span>nvidia.com_clusterpolicies_crd.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell65">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Fetch latest values from the chart (replace the <code class="docutils literal notranslate"><span class="pre">.x</span></code> below with the desired version)</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell66"><span></span><span class="gp">$ </span>helm<span class="w"> </span>show<span class="w"> </span>values<span class="w"> </span>nvidia/gpu-operator<span class="w"> </span>--version<span class="o">=</span>v22.9.x<span class="w"> </span>&gt;<span class="w"> </span>values-22.9.x.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell66">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>Update the values file as needed.</p>
<p>And upgrade via Helm:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell67"><span></span><span class="gp">$ </span>helm<span class="w"> </span>upgrade<span class="w"> </span>gpu-operator<span class="w"> </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>-f<span class="w"> </span>values-22.9.x.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell67">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
</section>
<section id="option-2-auto-upgrade-crd-using-helm-hook">
<h4>Option 2 - auto upgrade CRD using Helm hook<a class="headerlink" href="#option-2-auto-upgrade-crd-using-helm-hook" title="Permalink to this heading"></a></h4>
<p>Starting with GPU Operator v22.09, a <code class="docutils literal notranslate"><span class="pre">pre-upgrade</span></code> Helm <a class="reference external" href="https://helm.sh/docs/topics/charts_hooks/#the-available-hooks">hook</a> is utilized to automatically upgrade to latest CRD.
A new parameter <code class="docutils literal notranslate"><span class="pre">operator.upgradeCRD</span></code> is added to to trigger this hook during GPU Operator upgrade using Helm. This is disabled by default.
This parameter needs to be set using <code class="docutils literal notranslate"><span class="pre">--set</span> <span class="pre">operator.upgradeCRD=true</span></code> option during upgrade command as below.</p>
<p>Fetch latest values from the chart (replace the <code class="docutils literal notranslate"><span class="pre">.x</span></code> below with the desired version)</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell68"><span></span><span class="gp">$ </span>helm<span class="w"> </span>show<span class="w"> </span>values<span class="w"> </span>nvidia/gpu-operator<span class="w"> </span>--version<span class="o">=</span>v22.9.x<span class="w"> </span>&gt;<span class="w"> </span>values-v22.9.x.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell68">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell69"><span></span><span class="gp">$ </span>helm<span class="w"> </span>upgrade<span class="w"> </span>gpu-operator<span class="w"> </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span>--set<span class="w"> </span>operator.upgradeCRD<span class="o">=</span><span class="nb">true</span><span class="w"> </span>--disable-openapi-validation<span class="w"> </span>-f<span class="w"> </span>values-v22.9.x.yaml
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell69">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="admonition note">
<p class="admonition-title">Note</p>
<ul class="simple">
<li><p>Option <code class="docutils literal notranslate"><span class="pre">--disable-openapi-validation</span></code> is required in this case so that Helm will not try to validate if CR instance from the new chart is valid as per old CRD.
Since CR instance in the Chart is valid for the upgraded CRD, this will be compatible.</p></li>
<li><p>Helm hooks used with the GPU Operator use the operator image itself. If operator image itself cannot be pulled successfully (either due to network error or an invalid NGC registry secret in case of NVAIE), hooks will fail.
In this case, chart needs to be deleted using <code class="docutils literal notranslate"><span class="pre">--no-hooks</span></code> option to avoid deletion to be hung on hook failures.</p></li>
</ul>
</div>
</section>
<section id="cluster-policy-updates">
<h4>Cluster Policy Updates<a class="headerlink" href="#cluster-policy-updates" title="Permalink to this heading"></a></h4>
<p>The GPU Operator also supports dynamic updates to the <code class="docutils literal notranslate"><span class="pre">ClusterPolicy</span></code> CustomResource using <code class="docutils literal notranslate"><span class="pre">kubectl</span></code>:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell70"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>edit<span class="w"> </span>clusterpolicy
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell70">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>After the edits are complete, Kubernetes will automatically apply the updates to cluster.</p>
</section>
<section id="additional-controls-for-driver-upgrades">
<h4>Additional Controls for Driver Upgrades<a class="headerlink" href="#additional-controls-for-driver-upgrades" title="Permalink to this heading"></a></h4>
<p>While most of the GPU Operator managed daemonsets can be upgraded seamlessly, the NVIDIA driver daemonset has special considerations.
Refer to <span class="xref std std-ref">gpu_driver_upgrades</span> to learn more about how to upgrade drivers with the GPU Operator.</p>
</section>
</section>
<section id="using-olm-in-openshift">
<h3>Using OLM in OpenShift<a class="headerlink" href="#using-olm-in-openshift" title="Permalink to this heading"></a></h3>
<p>For upgrading the GPU Operator when running in OpenShift, refer to the official documentation on upgrading installed operators:
<a class="reference external" href="https://docs.openshift.com/container-platform/4.8/operators/admin/olm-upgrading-operators.html">https://docs.openshift.com/container-platform/4.8/operators/admin/olm-upgrading-operators.html</a></p>
</section>
</section>
<section id="uninstall">
<h2>Uninstall<a class="headerlink" href="#uninstall" title="Permalink to this heading"></a></h2>
<p>To uninstall the operator:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell71"><span></span><span class="gp">$ </span>helm<span class="w"> </span>delete<span class="w"> </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span><span class="k">$(</span>helm<span class="w"> </span>list<span class="w"> </span>-n<span class="w"> </span>gpu-operator<span class="w"> </span><span class="p">|</span><span class="w"> </span>grep<span class="w"> </span>gpu-operator<span class="w"> </span><span class="p">|</span><span class="w"> </span>awk<span class="w"> </span><span class="s1">'{print $1}'</span><span class="k">)</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell71">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>You should now see all the pods being deleted:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell72"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>pods<span class="w"> </span>-n<span class="w"> </span>gpu-operator
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell72">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell73"><span></span><span class="go">No resources found.</span>
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell73">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>By default, Helm does not <a class="reference external" href="https://helm.sh/docs/chart_best_practices/custom_resource_definitions/#some-caveats-and-explanations">support</a> deletion of existing CRDs when the Chart is deleted.
Thus <code class="docutils literal notranslate"><span class="pre">clusterpolicy</span></code> CRD will still remain by default.</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell74"><span></span><span class="gp">$ </span>kubectl<span class="w"> </span>get<span class="w"> </span>crds<span class="w"> </span>-A<span class="w"> </span><span class="p">|</span><span class="w"> </span>grep<span class="w"> </span>-i<span class="w"> </span>clusterpolicies.nvidia.com
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell74">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<p>To overcome this, a <code class="docutils literal notranslate"><span class="pre">post-delete</span></code> <a class="reference external" href="https://helm.sh/docs/topics/charts_hooks/#the-available-hooks">hook</a> is used in the GPU Operator to perform the CRD cleanup. A new parameter <code class="docutils literal notranslate"><span class="pre">operator.cleanupCRD</span></code>
is added to enable this hook. This is disabled by default. This paramter needs to be enabled with <code class="docutils literal notranslate"><span class="pre">--set</span> <span class="pre">operator.cleanupCRD=true</span></code> during install or upgrade for automatic CRD cleanup to happen on chart deletion.</p>
<div class="admonition note">
<p class="admonition-title">Note</p>
<ul class="simple">
<li><p>After un-install of GPU Operator, the NVIDIA driver modules might still be loaded.</p></li>
</ul>
<p>Either reboot the node or unload them using the following command:</p>
<div class="highlight-console notranslate"><div class="highlight"><pre id="codecell75"><span></span><span class="gp">$ </span>sudo<span class="w"> </span>rmmod<span class="w"> </span>nvidia_modeset<span class="w"> </span>nvidia_uvm<span class="w"> </span>nvidia
</pre><button class="copybtn o-tooltip--left" data-tooltip="Copy" data-clipboard-target="#codecell75">
      <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-copy" width="44" height="44" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  <title>Copy to clipboard</title>
  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
  <rect x="8" y="8" width="12" height="12" rx="2"></rect>
  <path d="M16 8v-2a2 2 0 0 0 -2 -2h-8a2 2 0 0 0 -2 2v8a2 2 0 0 0 2 2h2"></path>
</svg>
    </button></div>
</div>
<ul class="simple">
<li><p>Helm hooks used with the GPU Operator use the operator image itself. If operator image itself cannot be pulled successfully (either due to network error or an invalid NGC registry secret in case of NVAIE), hooks will fail.
In this case, chart needs to be deleted using <code class="docutils literal notranslate"><span class="pre">--no-hooks</span></code> option to avoid deletion to be hung on hook failures.</p></li>
</ul>
</div>
</section>
</section>


           </div>
          </div>
          <footer><div class="rst-footer-buttons" role="navigation" aria-label="Footer">
        <a href="overview.html" class="btn btn-neutral float-left" title="Overview" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left" aria-hidden="true"></span> Previous</a>
        <a href="platform-support.html" class="btn btn-neutral float-right" title="Platform Support" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right" aria-hidden="true"></span></a>
    </div>

  <hr>

  

</footer>
        </div>
      </div>
    </section>
	
	{% endraw %}
