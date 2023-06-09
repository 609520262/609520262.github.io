---
title: quick_start
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
        
      <li>30分钟玩转PaddleClas</li>
    
    
      <li class="wy-breadcrumbs-aside">
        
            
            
              <a href="https://github.com/PaddlePaddle/PaddleClas/blob/master/docs/zh_CN/tutorials/quick_start.md" class="fa fa-github"> Edit on GitHub</a>
            
          
        
      </li>
    
  </ul>

  
  <hr>
</div>
          <div role="main" class="document" itemscope="itemscope" itemtype="http://schema.org/Article">
           <div itemprop="articleBody">
            
  <div class="section" id="paddleclas">
<h1>30分钟玩转PaddleClas<a class="headerlink" href="#paddleclas" title="永久链接至标题">¶</a></h1>
<p>基于flowers102数据集，30分钟体验PaddleClas不同骨干网络的模型训练、不同预训练模型、SSLD知识蒸馏方案和数据增广的效果。请事先参考<a class="reference internal" href="install.html"><span class="doc">安装指南</span></a>配置运行环境和克隆PaddleClas代码。</p>
<div class="section" id="id1">
<h2>一、数据和模型准备<a class="headerlink" href="#id1" title="永久链接至标题">¶</a></h2>
<ul class="simple">
<li>进入PaddleClas目录。</li>
</ul>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">cd</span> <span class="n">path_to_PaddleClas</span>
</pre></div>
</div>
<ul class="simple">
<li>进入<code class="docutils literal notranslate"><span class="pre">dataset/flowers102</span></code>目录，下载并解压flowers102数据集.</li>
</ul>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">cd</span> dataset/flowers102
wget https://www.robots.ox.ac.uk/~vgg/data/flowers/102/102flowers.tgz
wget https://www.robots.ox.ac.uk/~vgg/data/flowers/102/imagelabels.mat
wget https://www.robots.ox.ac.uk/~vgg/data/flowers/102/setid.mat
tar -xf 102flowers.tgz
</pre></div>
</div>
<ul class="simple">
<li>制作train/val/test标签文件</li>
</ul>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span>python generate_flowers102_list.py jpg train &gt; train_list.txt
python generate_flowers102_list.py jpg valid &gt; val_list.txt
python generate_flowers102_list.py jpg <span class="nb">test</span> &gt; extra_list.txt
cat train_list.txt extra_list.txt &gt; train_extra_list.txt
</pre></div>
</div>
<p><strong>注意</strong>：这里将train_list.txt和extra_list.txt合并成train_extra_list.txt，是为了之后在进行知识蒸馏时，使用更多的数据提升无标签知识蒸馏任务的效果。</p>
<ul class="simple">
<li>返回<code class="docutils literal notranslate"><span class="pre">PaddleClas</span></code>根目录</li>
</ul>
<div class="highlight-default notranslate"><div class="highlight"><pre><span></span><span class="n">cd</span> <span class="o">../../</span>
</pre></div>
</div>
</div>
<div class="section" id="id2">
<h2>二、环境准备<a class="headerlink" href="#id2" title="永久链接至标题">¶</a></h2>
<div class="section" id="pythonpath">
<h3>2.1 设置PYTHONPATH环境变量<a class="headerlink" href="#pythonpath" title="永久链接至标题">¶</a></h3>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span> <span class="nv">PYTHONPATH</span><span class="o">=</span>./:<span class="nv">$PYTHONPATH</span>
</pre></div>
</div>
</div>
<div class="section" id="id3">
<h3>下载预训练模型<a class="headerlink" href="#id3" title="永久链接至标题">¶</a></h3>
<p>通过tools/download.py下载所需要的预训练模型。</p>
<div class="highlight-bash notranslate"><div class="highlight"><pre><span></span>python tools/download.py -a ResNet50_vd -p ./pretrained -d True
python tools/download.py -a ResNet50_vd_ssld -p ./pretrained -d True
python tools/download.py -a MobileNetV3_large_x1_0 -p ./pretrained -d True
</pre></div>
</div>
<p>参数说明：</p>
<ul class="simple">
<li><code class="docutils literal notranslate"><span class="pre">architecture</span></code>（简写 a）：模型结构</li>
<li><code class="docutils literal notranslate"><span class="pre">path</span></code>（简写 p）：下载路径</li>
<li><code class="docutils literal notranslate"><span class="pre">decompress</span></code> （简写 d）：是否解压</li>
</ul>
</div>
<div class="section" id="id4">
<h3>2.2 环境说明<a class="headerlink" href="#id4" title="永久链接至标题">¶</a></h3>
<ul class="simple">
<li>下面所有的训练过程均在<code class="docutils literal notranslate"><span class="pre">单卡V100</span></code>机器上运行。</li>
</ul>
</div>
</div>
<div class="section" id="id5">
<h2>三、模型训练<a class="headerlink" href="#id5" title="永久链接至标题">¶</a></h2>
<div class="section" id="id6">
<h3>3.1 零基础训练：不加载预训练模型的训练<a class="headerlink" href="#id6" title="永久链接至标题">¶</a></h3>
<ul class="simple">
<li>基于ResNet50_vd模型，训练脚本如下所示。</li>
</ul>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span>&nbsp;<span class="nv">CUDA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">0</span>
python&nbsp;-m&nbsp;paddle.distributed.launch&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;--selected_gpus<span class="o">=</span><span class="s2">"0"</span>&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;tools/train.py&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-c&nbsp;./configs/quick_start/ResNet50_vd.yaml
</pre></div>
</div>
<p>验证集的<code class="docutils literal notranslate"><span class="pre">Top1</span> <span class="pre">Acc</span></code>曲线如下所示，最高准确率为0.2735。</p>
<p><img alt="../_images/r50_vd_acc.png" src="../_images/r50_vd_acc.png"></p>
</div>
<div class="section" id="resnet50-vd-79-12">
<h3>3.2 模型微调-基于ResNet50_vd预训练模型(准确率79.12%)<a class="headerlink" href="#resnet50-vd-79-12" title="永久链接至标题">¶</a></h3>
<ul class="simple">
<li>基于ImageNet1k分类预训练模型进行微调，训练脚本如下所示。</li>
</ul>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span>&nbsp;<span class="nv">CUDA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">0</span>
python&nbsp;-m&nbsp;paddle.distributed.launch&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;--selected_gpus<span class="o">=</span><span class="s2">"0"</span>&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;tools/train.py&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-c&nbsp;./configs/quick_start/ResNet50_vd_finetune.yaml
</pre></div>
</div>
<p>验证集的<code class="docutils literal notranslate"><span class="pre">Top1</span> <span class="pre">Acc</span></code>曲线如下所示，最高准确率为0.9402，加载预训练模型之后，flowers102数据集精度大幅提升，绝对精度涨幅超过65%。</p>
<p><img alt="../_images/r50_vd_pretrained_acc.png" src="../_images/r50_vd_pretrained_acc.png"></p>
</div>
<div class="section" id="ssld-resnet50-vd-ssld-82-39">
<h3>3.3 SSLD模型微调-基于ResNet50_vd_ssld预训练模型(准确率82.39%)<a class="headerlink" href="#ssld-resnet50-vd-ssld-82-39" title="永久链接至标题">¶</a></h3>
<p>需要注意的是，在使用通过知识蒸馏得到的预训练模型进行微调时，我们推荐使用相对较小的网络中间层学习率。</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">ARCHITECTURE</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="s">'ResNet50_vd'</span>
    <span class="nt">params</span><span class="p">:</span>
        <span class="nt">lr_mult_list</span><span class="p">:</span> <span class="p p-Indicator">[</span><span class="nv">0.1</span><span class="p p-Indicator">,</span> <span class="nv">0.1</span><span class="p p-Indicator">,</span> <span class="nv">0.2</span><span class="p p-Indicator">,</span> <span class="nv">0.2</span><span class="p p-Indicator">,</span> <span class="nv">0.3</span><span class="p p-Indicator">]</span>
<span class="nt">pretrained_model</span><span class="p">:</span> <span class="s">"./pretrained/ResNet50_vd_ssld_pretrained"</span>
</pre></div>
</div>
<p>训练脚本如下。</p>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span>&nbsp;<span class="nv">CUDA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">0</span>
python&nbsp;-m&nbsp;paddle.distributed.launch&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;--selected_gpus<span class="o">=</span><span class="s2">"0"</span>&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;tools/train.py&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-c&nbsp;./configs/quick_start/ResNet50_vd_ssld_finetune.yaml
</pre></div>
</div>
<p>最终flowers102验证集上精度指标为0.95，相对于79.12%预训练模型的微调结构，新数据集指标可以再次提升0.9%。</p>
</div>
<div class="section" id="mobilenetv3">
<h3>3.4 尝试更多的模型结构-MobileNetV3<a class="headerlink" href="#mobilenetv3" title="永久链接至标题">¶</a></h3>
<p>训练脚本如下所示。</p>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span>&nbsp;<span class="nv">CUDA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">0</span>
python&nbsp;-m&nbsp;paddle.distributed.launch&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;--selected_gpus<span class="o">=</span><span class="s2">"0"</span>&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;tools/train.py&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-c&nbsp;./configs/quick_start/MobileNetV3_large_x1_0_finetune.yaml
</pre></div>
</div>
<p>最终flowers102验证集上的精度为0.90，比加载了预训练模型的ResNet50_vd的精度差了5%。不同模型结构的网络在相同数据集上的性能表现不同，需要根据预测耗时以及存储的需求选择合适的模型。</p>
</div>
<div class="section" id="randomerasing">
<h3>3.5 数据增广的尝试-RandomErasing<a class="headerlink" href="#randomerasing" title="永久链接至标题">¶</a></h3>
<p>训练数据量较小时，使用数据增广可以进一步提升模型精度，基于<code class="docutils literal notranslate"><span class="pre">3.3节</span></code>中的训练方法，结合RandomErasing的数据增广方式进行训练，具体的训练脚本如下所示。</p>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span>&nbsp;<span class="nv">CUDA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">0</span>
python&nbsp;-m&nbsp;paddle.distributed.launch&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;--selected_gpus<span class="o">=</span><span class="s2">"0"</span>&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;tools/train.py&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-c&nbsp;./configs/quick_start/ResNet50_vd_ssld_random_erasing_finetune.yaml
</pre></div>
</div>
<p>最终flowers102验证集上的精度为0.9627，使用数据增广可以使得模型精度再次提升1.27%。</p>
<ul class="simple">
<li>如果希望体验<code class="docutils literal notranslate"><span class="pre">3.6节</span></code>的知识蒸馏部分，可以首先保存训练得到的ResNet50_vd预训练模型到合适的位置，作为蒸馏时教师模型的预训练模型。脚本如下所示。</li>
</ul>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span>cp -r output/ResNet50_vd/19/  ./pretrained/flowers102_R50_vd_final/
</pre></div>
</div>
</div>
<div class="section" id="id7">
<h3>3.6 知识蒸馏小试牛刀<a class="headerlink" href="#id7" title="永久链接至标题">¶</a></h3>
<ul class="simple">
<li>使用flowers102数据集进行模型蒸馏，为了进一步提提升模型的精度，使用extra_list.txt充当无标签数据，在这里有几点需要注意：<ul>
<li><code class="docutils literal notranslate"><span class="pre">extra_list.txt</span></code>与<code class="docutils literal notranslate"><span class="pre">val_list.txt</span></code>的样本没有重复，因此可以用于扩充知识蒸馏任务的训练数据。</li>
<li>即使引入了有标签的extra_list.txt中的图像，但是代码中没有使用标签信息，因此仍然可以视为无标签的模型蒸馏。</li>
<li>蒸馏过程中，教师模型使用的预训练模型为flowers102数据集上的训练结果，学生模型使用的是ImageNet1k数据集上精度为75.32%的MobileNetV3_large_x1_0预训练模型。</li>
</ul>
</li>
</ul>
<p>配置文件中数据数量、模型结构、预训练地址以及训练的数据配置如下：</p>
<div class="highlight-yaml notranslate"><div class="highlight"><pre><span></span><span class="nt">total_images</span><span class="p">:</span> <span class="l l-Scalar l-Scalar-Plain">7169</span>
<span class="nt">ARCHITECTURE</span><span class="p">:</span>
    <span class="nt">name</span><span class="p">:</span> <span class="s">'ResNet50_vd_distill_MobileNetV3_large_x1_0'</span>
<span class="nt">pretrained_model</span><span class="p">:</span>
    <span class="p p-Indicator">-</span> <span class="s">"./pretrained/flowers102_R50_vd_final/ppcls"</span>
    <span class="p p-Indicator">-</span> <span class="s">"./pretrained/MobileNetV3_large_x1_0_pretrained/”</span>
<span class="s">TRAIN:</span>
    <span class="s">file_list:</span><span class="nv"> </span><span class="s">"</span><span class="l l-Scalar l-Scalar-Plain">./dataset/flowers102/train_extra_list.txt"</span>
</pre></div>
</div>
<p>最终的训练脚本如下所示。</p>
<div class="highlight-shell notranslate"><div class="highlight"><pre><span></span><span class="nb">export</span>&nbsp;<span class="nv">CUDA_VISIBLE_DEVICES</span><span class="o">=</span><span class="m">0</span>
python&nbsp;-m&nbsp;paddle.distributed.launch&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;--selected_gpus<span class="o">=</span><span class="s2">"0"</span>&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;tools/train.py&nbsp;<span class="se">\</span>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-c&nbsp;./configs/quick_start/R50_vd_distill_MV3_large_x1_0.yaml
</pre></div>
</div>
<p>最终flowers102验证集上的精度为0.9647，结合更多的无标签数据，使用教师模型进行知识蒸馏，MobileNetV3的精度涨幅高达6.47%。</p>
</div>
<div class="section" id="id8">
<h3>3.6 精度一览<a class="headerlink" href="#id8" title="永久链接至标题">¶</a></h3>
<ul class="simple">
<li>下表给出了不同训练yaml文件对应的精度。</li>
</ul>
<div class="wy-table-responsive"><table border="1" class="docutils">
<thead>
<tr>
<th>配置文件</th>
<th align="center">Top1 Acc</th>
</tr>
</thead>
<tbody>
<tr>
<td>ResNet50_vd.yaml</td>
<td align="center">0.2735</td>
</tr>
<tr>
<td>MobileNetV3_large_x1_0_finetune.yaml</td>
<td align="center">0.9000</td>
</tr>
<tr>
<td>ResNet50_vd_finetune.yaml</td>
<td align="center">0.9402</td>
</tr>
<tr>
<td>ResNet50_vd_ssld_finetune.yaml</td>
<td align="center">0.9500</td>
</tr>
<tr>
<td>ResNet50_vd_ssld_random_erasing_finetune.yaml</td>
<td align="center">0.9627</td>
</tr>
<tr>
<td>R50_vd_distill_MV3_large_x1_0.yaml</td>
<td align="center">0.9647</td>
</tr>
</tbody>
</table></div><p>下图给出了不同配置文件在迭代过程中的<code class="docutils literal notranslate"><span class="pre">Top1</span> <span class="pre">Acc</span></code>的精度曲线变化图。</p>
<p><img alt="../_images/all_acc.png" src="../_images/all_acc.png"></p>
<ul class="simple">
<li><strong>注意</strong>：flowers102数据集图片数量较少，因此进行训练时，验证集的精度指标可能会有1%左右的波动。</li>
<li>更多训练及评估流程，请参考<a class="reference internal" href="getting_started.html"><span class="doc">开始使用文档</span></a></li>
</ul>
</div>
</div>
</div>


           </div>
           
          </div>
          <footer>
  
    <div class="rst-footer-buttons" role="navigation" aria-label="footer navigation">
      
        <a href="data.html" class="btn btn-neutral float-right" title="数据说明" accesskey="n" rel="next">Next <span class="fa fa-arrow-circle-right"></span></a>
      
      
        <a href="install.html" class="btn btn-neutral float-left" title="安装说明" accesskey="p" rel="prev"><span class="fa fa-arrow-circle-left"></span> Previous</a>
      
    </div>
  

  <hr><div><div id="rtd-sidebar" data-ea-publisher="readthedocs" data-ea-type="readthedocs-sidebar" data-ea-manual="true" class="ethical-rtd" data-ea-keywords="only words|paddleclas|readthedocs-project-593273|readthedocs-project-paddleclas" data-ea-campaign-types="community|house|paid"></div></div>

  
</footer>

        </div>
      </div>

    </section>
	
	
	{% endraw %}
