---
title: begin
date: 2023-03-08 20:35:48
---

{% raw %}


  <section data-toggle="wy-nav-shift" class="wy-nav-content-wrap">

      
      <nav class="wy-nav-top" aria-label="top navigation">
        
          <i data-toggle="wy-nav-top" class="fa fa-bars"></i>
          <a href="../index.html">PaddleClas</a>
        
      </nav>


      <div class="wy-nav-content">
        
        <div class="rst-content">
        
          















<div role="navigation" aria-label="breadcrumbs navigation">

  <ul class="wy-breadcrumbs">
    
      <li><a href="../index.html">Docs</a> »</li>
        
          <li><a href="index.html">初级使用</a> »</li>
        
      <li>开始使用</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
            
              <a href="https://github.com/PaddlePaddle/PaddleClas/blob/master/docs/zh_CN/tutorials/getting_started.md" class="fa fa-github"> Edit on GitHub</a>
            
          
        
      </li>
    
  </ul>

  
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  <div class="section" id="id1">
<h1>开始使用<a class="headerlink" href="#id1" title="永久链接至标题">¶</a></h1>
<hr class="docutils">
<p>请事先参考<a class="reference internal" href="install.html"><span class="doc">安装指南</span></a>配置运行环境，并根据<a class="reference internal" href="data.html"><span class="doc">数据说明</span></a>文档准备ImageNet1k数据，本章节下面所有的实验均以ImageNet1k数据集为例。</p>
<div class="section" id="id2">
<h2>一、设置环境变量<a class="headerlink" href="#id2" title="永久链接至标题">¶</a></h2>
<p><strong>设置PYTHONPATH环境变量：</strong></p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span> <span class="nv">PYTHONPATH</span><span class="o">=</span>path_to_PaddleClas:<span class="nv">$PYTHONPATH</span>
</pre></div>
</div>
</div>
<div class="section" id="id3">
<h2>二、模型训练与评估<a class="headerlink" href="#id3" title="永久链接至标题">¶</a></h2>
<p>PaddleClas 提供模型训练与评估脚本：<code class="docutils literal notranslate"><span class="pre">tools/train.py</span></code>和<code class="docutils literal notranslate"><span class="pre">tools/eval.py</span></code></p>
<div class="section" id="id4">
<h3>2.1 模型训练<a class="headerlink" href="#id4" title="永久链接至标题">¶</a></h3>
<p>按照如下方式启动模型训练。</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span><span class="c1"># PaddleClas通过launch方式启动多卡多进程训练</span>
<span class="c1"># 通过设置FLAGS_selected_gpus 指定GPU运行卡号</span>

python -m paddle.distributed.launch <span class="se">\</span>
    --selected_gpus<span class="o">=</span><span class="s2">"0,1,2,3"</span> <span class="se">\</span>
    tools/train.py <span class="se">\</span>
        -c ./configs/ResNet/ResNet50_vd.yaml
</pre></div>
</div>
<ul class="simple">
<li>输出日志示例如下：</li>
</ul>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">epoch</span><span class="p">:</span><span class="mi">0</span>    <span class="n">train</span>    <span class="n">step</span><span class="p">:</span><span class="mi">13</span>    <span class="n">loss</span><span class="p">:</span><span class="mf">7.9561</span>    <span class="n">top1</span><span class="p">:</span><span class="mf">0.0156</span>    <span class="n">top5</span><span class="p">:</span><span class="mf">0.1094</span>    <span class="n">lr</span><span class="p">:</span><span class="mf">0.100000</span>    <span class="n">elapse</span><span class="p">:</span><span class="mf">0.193</span>
</pre></div>
</div>
<p>可以通过添加-o参数来更新配置：</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python -m paddle.distributed.launch <span class="se">\</span>
    --selected_gpus<span class="o">=</span><span class="s2">"0,1,2,3"</span> <span class="se">\</span>
    tools/train.py <span class="se">\</span>
        -c ./configs/ResNet/ResNet50_vd.yaml <span class="se">\</span>
        -o <span class="nv">use_mix</span><span class="o">=</span><span class="m">1</span> <span class="se">\</span>
	--vdl_dir<span class="o">=</span>./scalar/
</pre></div>
</div>
<ul class="simple">
<li>输出日志示例如下：</li>
</ul>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">epoch</span><span class="p">:</span><span class="mi">0</span>    <span class="n">train</span>    <span class="n">step</span><span class="p">:</span><span class="mi">522</span>    <span class="n">loss</span><span class="p">:</span><span class="mf">1.6330</span>    <span class="n">lr</span><span class="p">:</span><span class="mf">0.100000</span>    <span class="n">elapse</span><span class="p">:</span><span class="mf">0.210</span>
</pre></div>
</div>
<p>也可以直接修改模型对应的配置文件更新配置。具体配置参数参考<a class="reference internal" href="config.html"><span class="doc">配置文档</span></a>。</p>
<p>训练期间可以通过VisualDL实时观察loss变化，启动命令如下：</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>visualdl --logdir ./scalar --host &lt;host_IP&gt; --port &lt;port_num&gt;
</pre></div>
</div>
</div>
<div class="section" id="id5">
<h3>2.2 模型微调<a class="headerlink" href="#id5" title="永久链接至标题">¶</a></h3>
<ul class="simple">
<li><a class="reference internal" href="quick_start.html"><span class="doc">30分钟玩转PaddleClas</span></a>中包含大量模型微调的示例，可以参考该章节在特定的数据集上进行模型微调。</li>
</ul>
</div>
<div class="section" id="id6">
<h3>2.3 模型评估<a class="headerlink" href="#id6" title="永久链接至标题">¶</a></h3>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python tools/eval.py <span class="se">\</span>
    -c ./configs/eval.yaml <span class="se">\</span>
    -o ARCHITECTURE.name<span class="o">=</span><span class="s2">"ResNet50_vd"</span> <span class="se">\</span>
    -o <span class="nv">pretrained_model</span><span class="o">=</span>path_to_pretrained_models
</pre></div>
</div>
<p>可以更改configs/eval.yaml中的<code class="docutils literal notranslate"><span class="pre">ARCHITECTURE.name</span></code>字段和pretrained_model字段来配置评估模型，也可以通过-o参数更新配置。</p>
<p><strong>注意：</strong> 加载预训练模型时，需要指定预训练模型的前缀，例如预训练模型参数所在的文件夹为<code class="docutils literal notranslate"><span class="pre">output/ResNet50_vd/19</span></code>，预训练模型参数的名称为<code class="docutils literal notranslate"><span class="pre">output/ResNet50_vd/19/ppcls.pdparams</span></code>，则<code class="docutils literal notranslate"><span class="pre">pretrained_model</span></code>参数需要指定为<code class="docutils literal notranslate"><span class="pre">output/ResNet50_vd/19/ppcls</span></code>，PaddleClas会自动补齐<code class="docutils literal notranslate"><span class="pre">.pdparams</span></code>的后缀。</p>
</div>
</div>
<div class="section" id="id7">
<h2>三、模型推理<a class="headerlink" href="#id7" title="永久链接至标题">¶</a></h2>
<p>PaddlePaddle提供三种方式进行预测推理，接下来介绍如何用预测引擎进行推理：
首先，对训练好的模型进行转换：</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python tools/export_model.py <span class="se">\</span>
    --model<span class="o">=</span>模型名字 <span class="se">\</span>
    --pretrained_model<span class="o">=</span>预训练模型路径 <span class="se">\</span>
    --output_path<span class="o">=</span>预测模型保存路径
</pre></div>
</div>
<p>之后，通过预测引擎进行推理：</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python tools/infer/predict.py <span class="se">\</span>
    -m model文件路径 <span class="se">\</span>
    -p params文件路径 <span class="se">\</span>
    -i 图片路径 <span class="se">\</span>
    --use_gpu<span class="o">=</span><span class="m">1</span> <span class="se">\</span>
    --use_tensorrt<span class="o">=</span>True
</pre></div>
</div>
<p>更多使用方法和推理方式请参考<a class="reference internal" href="../extension/paddle_inference.html"><span class="doc">分类预测框架</span></a>。</p>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="config.html" class="btn btn-neutral float-right" title="配置说明" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="data.html" class="btn btn-neutral float-left" title="数据说明" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
    </div>
  

  <hr><div><div id="rtd-sidebar" data-ea-publisher="readthedocs" data-ea-type="readthedocs-sidebar" data-ea-manual="true" class="ethical-rtd" data-ea-keywords="only words|paddleclas|readthedocs-project-593273|readthedocs-project-paddleclas" data-ea-campaign-types="community|house|paid"></div></div>

 
</footer>

        </div>
      </div>

    </section>
	
	
	{% endraw %}
